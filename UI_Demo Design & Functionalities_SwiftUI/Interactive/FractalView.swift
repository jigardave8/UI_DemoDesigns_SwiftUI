//
//  FractalView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct FractalView: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        VStack {
            Text("Fractal Animation")
                .font(.title)
                .padding()

            FractalShape(scale: scale)
                .onAppear {
                    withAnimation(.linear(duration: 10).repeatForever(autoreverses: false)) {
                        scale = 10.0
                    }
                }
        }
    }
}

struct FractalShape: View {
    var scale: CGFloat
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(Color.green, lineWidth: 2)
                .scaleEffect(scale)
                .frame(width: 100, height: 100)
                .opacity(0.5)
            
            ForEach(0..<4) { i in
                FractalShape(scale: scale / 2)
                    .rotationEffect(.degrees(Double(i) * 90))
                    .offset(x: scale / 2, y: 0)
            }
        }
    }
}
