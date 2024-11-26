//
//  Shapes3DView+Entities.swift
//  BuildingShapes
//
//  Created by Jia Jang on 11/26/24.
//

import RealityKit

extension Shapes3DView {
    // 빛에 반응하는 흰색 재질
    static let whiteMaterial = SimpleMaterial(color: .white, isMetallic: true)
    
    // box geometry를 가진 entity
    static let boxEntity: Entity = {
        // 빈 인스턴스 생성
        let entity = Entity()
        
        // 매시 리소스 생성
        let boxSize: Float = 0.1
        let boxMesh = MeshResource.generateBox(size: boxSize)
        
        // 모델 컴포넌트에 매시 리소스 추가하고 이걸 엔티티에 추가
        entity.components.set(ModelComponent(mesh: boxMesh, materials: [whiteMaterial]))
        
        return entity
    }()
    
    // 구형 geometry의 엔티티
    static let sphereEntity: Entity = {
        let entity = Entity()
        
        let sphereRadius: Float = 0.05
        let boxMesh = MeshResource.generateSphere(radius: sphereRadius)
        
        entity.components.set(ModelComponent(mesh: boxMesh, materials: [whiteMaterial]))
        
        return entity
    }()
    
    // 둥근 박스 모양 geometry의 엔티티
    static let roundedBoxEntity: Entity = {
        let entity = Entity()

        let boxSize: Float = 0.1
        let boxCornerRadius: Float = 0.03
        let roundedBoxMesh = MeshResource.generateBox(size: boxSize, cornerRadius: boxCornerRadius)

        entity.components.set(ModelComponent(mesh: roundedBoxMesh, materials: [whiteMaterial]))

        return entity
    }()
    
    // 콘 모양 geometry의 엔티티
    static let coneEntity: Entity = {
        let entity = Entity()
        
        let coneHeight: Float = 0.1
        let coneRadius: Float = 0.05
        let roundedBoxMesh = MeshResource.generateCone(height: coneHeight, radius: coneRadius)
        
        entity.components.set(ModelComponent(mesh: roundedBoxMesh, materials: [whiteMaterial]))
        
        return entity
    }()
    
    // 실린더 모양 geometry의 엔티티
    static let cylinderEntity: Entity = {
        let entity = Entity()
        
        let cylinderHeight: Float = 0.1
        let cylinderRadius: Float = 0.05
        let roundedBoxMesh = MeshResource.generateCylinder(height: cylinderHeight, radius: cylinderRadius)
        
        entity.components.set(ModelComponent(mesh: roundedBoxMesh, materials: [whiteMaterial]))
        
        return entity
    }()
}

