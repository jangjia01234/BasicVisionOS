//
//  Line.swift
//  BuildingShapes
//
//  Created by Jia Jang on 11/26/24.
//

import SwiftUI

struct Line: Shape {
    let endPoint1: CGPoint
    let endPoint2: CGPoint
    
    // CGFloat를 CGPoint로 변환
    init(_ length: CGFloat) {
        let point = CGPoint(x: length, y: 0.0)
        self.init(point)
    }
    
    init(_ point1: CGPoint, _ point2: CGPoint? = nil) {
        if let point2 {
            endPoint1 = point1
            endPoint2 = point2
        } else {
            endPoint1 = CGPoint.zero
            endPoint2 = point1
        }
    }
    
    func path(in bounds: CGRect) -> Path {
        // 삼각형을 그리는 path
        var path = Path()
        
        // 두 꼭짓점 사이에 선 그리기
        path.move(to: endPoint1)
        path.addLine(to: endPoint2)
        
        return path
    }
}

extension Line {
    func dashed(_ width: CGFloat, _ dashPattern: [CGFloat]? = nil) -> some Shape {
        let pattern = dashPattern ?? [width]
        let style = StrokeStyle(lineWidth: width, dash: pattern)
        
        return stroke(style: style)
    }
}
