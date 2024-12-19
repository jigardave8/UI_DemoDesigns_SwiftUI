//
//  MagneticFieldView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct MagneticFieldView: View {
    @State private var particles: [CGPoint] = Array(repeating: CGPoint(x: 150, y: 200), count: 10)
    @State private var centralPoint: CGPoint = .zero

    var body: some View {
        ZStack {
            ForEach(0..<particles.count, id: \.self) { index in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.green)
                    .position(particles[index])
                    .onAppear {
                        withAnimation(.linear(duration: 1).repeatForever(autoreverses: false)) {
                            particles[index] = magneticEffect(from: centralPoint)
                        }
                    }
            }

            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.red)
                .position(centralPoint)
                .gesture(DragGesture().onChanged { value in
                    centralPoint = value.location
                })
        }
        .frame(width: 300, height: 300)
    }

    func magneticEffect(from point: CGPoint) -> CGPoint {
        // Calculate magnetic force effect based on point position
        return CGPoint(x: point.x + CGFloat.random(in: -50...50), y: point.y + CGFloat.random(in: -50...50))
    }
}
