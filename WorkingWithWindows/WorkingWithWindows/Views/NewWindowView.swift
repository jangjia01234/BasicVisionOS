//
//  NewWindowView.swift
//  WorkingWithWindows
//
//  Created by Jia Jang on 11/26/24.
//

import SwiftUI

struct NewWindowView: View {
    // 새로운 뷰의 메인 identifier 역할을 함
    let id: Int
    
    var body: some View {
        // 윈도우의 id 값을 나타내는 텍스트
        Text("New window number \(id)")
    }
}
