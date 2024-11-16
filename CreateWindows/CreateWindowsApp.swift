//
//  CreateWindowsApp.swift
//  CreateWindows
//
//  Created by Jia Jang on 11/16/24.
//

import SwiftUI

@main
struct CreateWindowsApp: App {

    @State private var appModel = AppModel()

    var body: some Scene {
        WindowGroup {
            StartingView()
                .environment(appModel)
        }
        
        WindowGroup(id: "Window 1") {
            SampleView(color: .blue, text: "Window 1")
        }
        
        WindowGroup(id: "Window 2") {
            SampleView(color: .blue, text: "Window 2")
        }

        ImmersiveSpace(id: appModel.immersiveSpaceID) {
            ImmersiveView()
                .environment(appModel)
                .onAppear {
                    appModel.immersiveSpaceState = .open
                }
                .onDisappear {
                    appModel.immersiveSpaceState = .closed
                }
        }
        .immersionStyle(selection: .constant(.mixed), in: .mixed)
     }
}
