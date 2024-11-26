//
//  Triangle.swift
//  BuildingShapes
//
//  Created by Jia Jang on 11/26/24.
//

import SwiftUI

struct Triangle: Shape {
    let vertex1: CGPoint
    let vertex2: CGPoint
    let vertex3: CGPoint
    
    func path(in bounds: CGRect) -> Path {
        // 삼각형을 그리는 path
        var path = Path()
        
        // 첫 번째 vertex 시작 지점
        path.move(to: vertex1)
        
        // 삼각형의 첫 두 변을 그림
        path.addLine(to: vertex2)
        path.addLine(to: vertex3)
        
        // 첫 번째 vertex로 돌아옴으로써 삼각형의 세 번째 변을 그림
        path.closeSubpath()
        
        return path
    }
}
