//
//  ContentView.swift
//  ImplementingImmersiveSpace
//
//  Created by Jia Jang on 12/4/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    // OpenImmersiveSpaceAction 인스턴스를 가져오기 위한 환경 변수
    @Environment(\.openImmersiveSpace) var openImmersiveSpace
    
    // 엔티티의 처음 위치
    @State var initialPosition: SIMD3<Float>? = nil
    
    // 엔티티의 처음 크기
    @State var initialScale: SIMD3<Float>? = nil
    
    var body: some View {
        // 새로운 immersive space 환경 열기
        Text("Use gestures to move the car")
            .onAppear {
                Task {
                    await openImmersiveSpace(id: "CarView")
                }
            }
    }
}

struct CarView: View {
    var body: some View {
        RealityView { content in
            let fileName: String = "Huracan-EVO-RWD-Spyder-opt-22"
            
            // 모델명으로 불러오기
            guard let car = try? await ModelEntity(named: fileName) else {
                assertionFailure("Failed to load model: \(fileName)")
                return
            }
            
            // 자동차 전체의 시각적 경계 영역
            let bounds = car.visualBounds(relativeTo: nil)
            
            // 모델 크기에 따른 충돌 박스의 너비
            let carWidth: Float = (car.model?.mesh.bounds.max.x)!
            
            // 모델 크기에 따른 충돌 박스의 높이
            let carHeight: Float = (car.model?.mesh.bounds.max.y)!
            
            // 모델 크기에 따른 충돌 박스의 깊이
            let carDepth: Float = (car.model?.mesh.bounds.max.z)!
            
            // 충돌 감지를 위해 모델 주변에 생성되는 boxShape
            let boxShape = ShapeResource.generateBox(
                width: carWidth,
                height: carHeight,
                depth: carDepth)
            
            // collision component 로 boxShape 추가
            car.components.set(CollisionComponent(shapes: [boxShape]))
            
            // Set the spawn position of the entity on the ground.
            // 엔티티의 지면 위 y축 spawn position
            car.position.y -= bounds.min.y
            
            // visual bounds의 반경을 기준으로 한 엔티티의 z축 spawn position
            car.position.z -= bounds.boundingRadius
            
            // RealityView 에 차 모델 추가
            content.add(car)
        }
        //        .gesture(translationGesture)
        //        .gesture(scaleGesture)
    }
}

extension SIMD3 where Scalar == Float {
    // y축 값을 0으로 고정시키기 위한 변수 (자동차를 땅에 고정시키기 위함)
    var grounded: SIMD3<Scalar> {
        return .init(x: x, y: 0, z: z)
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
