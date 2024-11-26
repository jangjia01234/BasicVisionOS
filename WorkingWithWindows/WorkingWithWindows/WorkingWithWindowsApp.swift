//
//  WorkingWithWindowsApp.swift
//  WorkingWithWindows
//
//  Created by Jia Jang on 11/26/24.
//

import SwiftUI

@main
struct WorkingWithWindowsApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        
        // 앱의 메인 뷰에서 새로 생성되는 WindowGroup
        WindowGroup("New Window", for: NewWindowID.ID.self) { $id in
            NewWindowView(id: id ?? 1)
        }
    }
}
