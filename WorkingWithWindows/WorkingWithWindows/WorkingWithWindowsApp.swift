//
//  WorkingWithWindowsApp.swift
//  WorkingWithWindows
//
//  Created by Jia Jang on 11/26/24.
//

import SwiftUI

@main
struct WorkingWithWindowsApp: App {
    // volumetric window의 높이 multiplier
    let heightModifier: CGFloat = 0.25
    
    var body: some Scene {
        // volumetric window로 윈도우 그룹 구성
        WindowGroup() {
            VolumetricWindow()
        }
        .windowStyle(.volumetric)
        // 윈도우 그룹의 크기를 volumetric window의 크기에 따라 조절
        .defaultSize(
            width: VolumetricWindow.defaultSize,
            height: heightModifier * VolumetricWindow.defaultSize,
            depth: VolumetricWindow.defaultSize,
            in: .meters
        )
        
        // MARK: Creating Windows
//        WindowGroup {
//            ContentView()
//        }
        
        // 앱의 메인 뷰에서 새로 생성되는 WindowGroup
//        WindowGroup("New Window", for: NewWindowID.ID.self) { $id in
//            NewWindowView(id: id ?? 1)
//        }
    }
}
