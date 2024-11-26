//
//  VolumetricWindow.swift
//  WorkingWithWindows
//
//  Created by Jia Jang on 11/26/24.
//

import SwiftUI
import RealityKit

// 3D 모델을 로드하고 모델과 같은 크기로 volumetric window를 설정하는 뷰
struct VolumetricWindow: View {
    // 큐브 모양의 volumetric window의 각 측면의 기본 길이 (단위: m)
    static let defaultSize: CGFloat = 1.5
    
    // 불러오려는 모델의 이름
    let modelName: String = "bull_trout"
    
    var body: some View {
        GeometryReader3D { geometry in
            RealityView { content in
                // 파일명을 사용하여 엔티티 불러오기
                guard let model = try? await ModelEntity(named: modelName) else {
                    return
                }
                
                // 모델을 RealityView에 추가
                content.add(model)
            }
            update: { content in
                // 크기 조절을 위해 로드한 엔티티 가져오기
                guard let model = content.entities.first(where: { $0.name == modelName }) else {
                    return
                }
                
                // 로컬 좌표에서 volume의 크기
                let viewBounds = content.convert(
                    geometry.frame(in: .local),
                    from: .local,
                    to: .scene
                )
                
                // 모델의 위치를 visual bounding box의 하단으로 설정
                model.position.y -= model.visualBounds(relativeTo: nil).min.y
                
                // 모델의 위치를 view bounds와 align되도록 y축에 적용
                model.position.y += viewBounds.min.y
                
                // 크기가 1일 때 모델의 기본 사이즈
                let baseExtents = model.visualBounds(relativeTo: nil).extents / model.scale
                
                // volumetric window의 bounds에 맞추기 위해 모델이 필요한 크기
                let scale = Float(viewBounds.extents.x) / baseExtents.x
                
                // 창의 전체를 채우기 위해 모델에 크기 적용
                model.scale = SIMD3<Float>(repeating: scale)
            }
        }
    }
}

//#Preview {
//    VolumetricWindow()
//}
