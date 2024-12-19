//
//  WaterRippleEffect.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct WaterRippleEffect: View {
    @State private var ripples: [Ripple] = []
    @State private var touchLocation: CGPoint = .zero

    var body: some View {
        ZStack {
            ForEach(ripples) { ripple in
                Circle()
                    .frame(width: ripple.size, height: ripple.size)
                    .foregroundColor(ripple.color)
                    .position(ripple.position)
                    .opacity(ripple.opacity)
            }
        }
        .frame(width: 300, height: 300)
        .gesture(DragGesture().onChanged { value in
            touchLocation = value.location
            createRipple(at: touchLocation)
        })
    }

    func createRipple(at point: CGPoint) {
        ripples.append(Ripple(position: point))
    }
}

struct Ripple: Identifiable {
    let id = UUID()
    var position: CGPoint
    var size: CGFloat = 10
    var opacity: Double = 1
    var color: Color = Color.blue.opacity(0.6)

    mutating func expand() {
        size += 20
        opacity -= 0.1
    }
}
