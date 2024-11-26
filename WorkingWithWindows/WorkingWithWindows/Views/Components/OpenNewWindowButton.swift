//
//  OpenNewWindowButton.swift
//  WorkingWithWindows
//
//  Created by Jia Jang on 11/26/24.
//

import SwiftUI

struct OpenNewWindowButton: View {
    // SwiftUI에서 윈도우를 구별하기 위해 사용하는 id 값
    @State var nextWindowID = NewWindowID(id: 1)
    
    // 'OpenWindowAction' 인스턴스를 가져오는 environment 값
    @Environment(\.openWindow) private var openWindow
    
    var body: some View {
        // 화면 가운데에 창을 생성하는 버튼
        Button("Open a new Window") {
            // 할당된 ID로 새 창 생성
            openWindow(value: nextWindowID.id)
            
            // '누를 때마다 nextWindowId'의 ID를 1씩 증가시킴
            nextWindowID.id += 1
        }
    }
 }
