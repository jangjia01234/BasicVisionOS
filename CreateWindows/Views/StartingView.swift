//
//  ContentView.swift
//  CreateWindows
//
//  Created by Jia Jang on 11/16/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct StartingView: View {
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        VStack(spacing: 40) {
            Model3D(named: "Scene", bundle: realityKitContentBundle)

            ToggleImmersiveSpaceButton()
            
            VStack {
                Button("Window 1") {
                    // On press action
                    openWindow(id: "Window 1")
                }
                
                Button("Window 2") {
                    openWindow(id: "Window 2")
                }
            }
        }
    }
}

#Preview(windowStyle: .automatic) {
    StartingView()
        .environment(AppModel())
}
