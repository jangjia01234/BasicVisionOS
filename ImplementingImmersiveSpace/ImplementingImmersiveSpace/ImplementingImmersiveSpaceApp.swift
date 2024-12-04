//
//  ImplementingImmersiveSpaceApp.swift
//  ImplementingImmersiveSpace
//
//  Created by Jia Jang on 12/4/24.
//

import SwiftUI

@main
struct ImplementingImmersiveSpaceApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        ImmersiveSpace(id: "CarView") {
            CarView()
        }
    }
}
