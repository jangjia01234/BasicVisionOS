//
//  ContentView.swift
//  Import3DObject
//
//  Created by Jia Jang on 11/17/24.
//

import SwiftUI
import RealityKit

struct ContentView: View {
    private let url = URL(string: "https://developer.apple.com/augmented-reality/quick-look/models/cosmonaut/CosmonautSuit_en.reality") 
    
    var body: some View {
        VStack {
            Text("show Cosmonaut")
            
            if let url = url {
                Model3D(url: url) { model in
                    model
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 400, height: 400)
                } placeholder: {
                    ProgressView()
                }
            }
        }
        .padding()
    }
}

#Preview(windowStyle: .automatic) {
    ContentView()
}
