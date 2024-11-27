//
//  ContentView.swift
//  DrawingText
//
//  Created by Jia Jang on 11/27/24.
//

import SwiftUI
import RealityKit
import RealityKitContent

struct ContentView: View {
    var body: some View {
        VStack(spacing: 40) {
            SwiftUIText()
            
            DepthTextView()
        }
    }
}

struct SwiftUIText: View {
    var body: some View {
        VStack(spacing: 30) {
            Text("Large title").font(.largeTitle)
            Text("Subheadline").font(.subheadline)
            Text("Bold").fontWeight(.bold)
            Text("Green Color").foregroundStyle(.green)
        }
    }
}

struct DepthTextView: View {
    let text = Text("Hello World").font(.extraLargeTitle)
    
    // 텍스트 레이어 간의 spacing offset 크기
    @State var animationProgress = 0.0
    
    // 창의 z축을 따라 늘어나는 텍스트 레이어의 갯수
    let layers = 5
    
    // 각 레이어 사이의 point 갯수
    let layerSpacing = 100
    
    var body: some View {
        ZStack {
            textShadowView
            textMiddleViews
            textFrontView
        }
        .onAppear(perform: animateWithSpringEffect)
    }
    
    // 완전히 불투명한 텍스트 뷰
    var textFrontView: some View {
        text.offset(z: Double(layerSpacing * layers) * animationProgress)
    }
    
    // z축을 따라 나열되는 반투명한 텍스트들
    var textMiddleViews: some View {
        ForEach(1..<layers, id: \.self) { layer in
            let layerPercent = Double(layer) / Double(layers)
            let maximumOffset = Double(layerSpacing * layers)
            let maximumOpacity = 1.0
            
            text
                .offset(z: maximumOffset * layerPercent * animationProgress)
                .opacity(maximumOpacity * layerPercent)
        }
    }
    
    // 창 위에서 그림자 역할을 하는 텍스트 뷰
    var textShadowView: some View {
        let blurRadius: CGFloat = 12
        let maximumOpacity = 0.6
        
        return text
            .foregroundStyle(.black)
            .blur(radius: blurRadius)
            .opacity(maximumOpacity * animationProgress)
    }
    
    // 스프링 애니메이션과 함께 offset 크기 값을 업데이트하는 함수
    func animateWithSpringEffect() {
        // 봄 애니메이션 효과에 대한 스프링 계수(미터당 newton)
        let stiffness: Double = 200
        
        // 스프링 애니메이션 효과의 감쇠 계수
        let damping: Double = 10
        
        let spring = Spring(stiffness: stiffness, damping: damping)
        let springAnimation = Animation.interpolatingSpring(spring).delay(1.0)
        
        // 스프링 효과와 함께 창 밖으로 텍스트가 튀어나오는 효과 활성화
        withAnimation(springAnimation) {
            animationProgress = 1.0
        }
    }
}

//#Preview(windowStyle: .automatic) {
//    ContentView()
//}
