//
//  SampleView.swift
//  CreateWindows
//
//  Created by Jia Jang on 11/16/24.
//

import SwiftUI

struct SampleView: View {
    var color: Color
    var text: String
    
    var body: some View {
        ZStack {
            Circle()
                .fill(color)
            
            Text(text)
                .font(.extraLargeTitle)
        }
        .padding(50)
    }
}

#Preview {
    SampleView(color: .orange, text: "Twist")
}
