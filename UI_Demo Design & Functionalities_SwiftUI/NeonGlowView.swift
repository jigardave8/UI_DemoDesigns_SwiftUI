//
//  NeonGlowView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct NeonGlowView: View {
    @State private var glowEffect = false

    var body: some View {
        Text("Neon Glow")
            .font(.largeTitle)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .padding()
            .background(BlurView())
            .clipShape(Capsule())
            .shadow(color: glowEffect ? Color.pink : Color.clear, radius: 10, x: 0, y: 0)
            .animation(.easeInOut(duration: 1).repeatForever(autoreverses: true), value: glowEffect)
            .onAppear {
                glowEffect.toggle()
            }
    }
}

struct BlurView: View {
    var body: some View {
        RoundedRectangle(cornerRadius: 25)
            .fill(Color.blue)
            .opacity(0.2)
    }
}
