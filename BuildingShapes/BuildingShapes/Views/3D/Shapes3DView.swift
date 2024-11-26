//
//  Shapes3DView.swift
//  BuildingShapes
//
//  Created by Jia Jang on 11/26/24.
//

import SwiftUI
import RealityKit

struct Shapes3DView: View {
    var body: some View {
        RealityView { content in
            addGeometryShapes(to: content)
        }
    }
    
    func addGeometryShapes(to content: RealityViewContent) {
        // 각기 다른 모양을 가진 모든 3D entity들의 배열
        let allGeometryEntities = [
            Shapes3DView.boxEntity,
            Shapes3DView.sphereEntity,
            Shapes3DView.roundedBoxEntity,
            Shapes3DView.coneEntity,
            Shapes3DView.cylinderEntity
        ]
        
        var xOffset: Float = -0.25
        
        // x축을 기준으로 entity들을 배치하고, content에 추가
        for entity in allGeometryEntities {
            // x축의 오프셋을 기준으로 엔티티의 위치 설정
            entity.position.x = xOffset

            // 엔티티를 RealityView content에 추가
            content.add(entity)
            
            // 다음 엔티티를 위해 x축의 오프셋 증가 (?)
            xOffset += 0.125
        }
    }
}

//#Preview {
//    Shapes3DView()
//}
