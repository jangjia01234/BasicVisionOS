//
//  Balls.swift
//  CreateWindows
//
//  Created by Jia Jang on 11/16/24.
//

import SwiftUI
import RealityKit

struct Balls: View {
    @State private var scale = false
    
    var body: some View {
        RealityView { content in
            // Generate multiple spheres
            for _ in 1...5 {
                let model = ModelEntity(
                    mesh: .generateSphere(radius: 0.025),
                    materials: [SimpleMaterial(color: .red, isMetallic: true)]
                )
                
                // Randomize position
                let x = Float.random(in: -0.2...0.2)
                let y = Float.random(in: -0.2...0.2)
                let z = Float.random(in: -0.2...0.2)
                model.position = SIMD3(x, y, z)
                
                // Enable interactions on the entity
                model.components.set(InputTargetComponent())
                model.components.set(CollisionComponent(shapes: [.generateSphere(radius: 0.025)]))
                content.add(model)
            }
        } update: { content in
            content.entities.forEach { entity in
                entity.transform.scale = scale ? SIMD3<Float>(2, 2, 2) : SIMD3<Float>(1, 1, 1)
            }
        }
        .gesture(TapGesture().targetedToAnyEntity().onEnded { _ in
            scale.toggle()
        })
    }
}

#Preview {
    Balls()
}

