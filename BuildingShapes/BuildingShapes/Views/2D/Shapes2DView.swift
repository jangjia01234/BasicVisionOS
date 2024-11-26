//
//  ShapeView.swift
//  BuildingShapes
//
//  Created by Jia Jang on 11/26/24.
//

import SwiftUI

struct Shapes2DView: View {
    // 각 shape 간의 간격
    let spaceBetweenShapes: CGFloat = 30.0
    
    // 각 shape view 프레임의 width와 height
    let shapeScale: CGFloat = 100.0
    
    // 각 shape가 가진 모든 선의 width
    let strokeWidth: CGFloat = 5.0
    
    var body: some View {
        // 삼각형의 위쪽 코너 좌표 (x: 0, y: 0)
        let vertex1 = CGPoint(x: 0.0, y: 0.0)
        
        // 삼각형의 좌하단 코너 좌표 (x: 100, x: 100)
        let vertex2 = CGPoint(x: shapeScale, y: shapeScale)
        
        // 삼각형의 우하단 코너 좌표 (x: 0, y: 100)
        let vertex3 = CGPoint(x: 0.0, y: shapeScale)
        
        // 점선의 패턴
        let strokePattern = [3 * strokeWidth, 2 * strokeWidth]
        
        HStack(spacing: spaceBetweenShapes) {
            Circle()
                .stroke(.red, lineWidth: strokeWidth)
                .frame(width: shapeScale, height: shapeScale)
            
            Rectangle()
                .stroke(.green, lineWidth: strokeWidth)
                .frame(width: shapeScale, height: shapeScale)
            
            Triangle(vertex1: vertex1, vertex2: vertex2, vertex3: vertex3)
                .stroke(.blue, lineWidth: strokeWidth)
                .frame(width: shapeScale, height: shapeScale)
            
            ZStack {
                Line(shapeScale)
                    .dashed(strokeWidth, strokePattern)
                    .frame(width: shapeScale, height: shapeScale)
                    .rotationEffect(.degrees(-90))
                
                Line(shapeScale)
                    .dashed(strokeWidth, strokePattern)
                    .frame(width: shapeScale, height: shapeScale)
                
                Line(shapeScale)
                    .dashed(strokeWidth, strokePattern)
                    .frame(width: shapeScale, height: shapeScale)
                    .rotationEffect(.degrees(90))
                
                Line(shapeScale)
                    .dashed(strokeWidth, strokePattern)
                    .frame(width: shapeScale, height: shapeScale)
                    .padding(.top, 200)
            }
        }
    }
}

//#Preview {
//    Shapes2DView()
//}
