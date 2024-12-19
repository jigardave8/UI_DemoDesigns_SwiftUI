//
//  RippleEffectView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct RippleEffectView: View {
    @State private var scale: CGFloat = 0
    @State private var opacity: Double = 1.0

    var body: some View {
        VStack {
            Button(action: {
                withAnimation(.easeOut(duration: 0.6)) {
                    scale = 1.5
                    opacity = 0
                }
            }) {
                Text("Ripple Effect")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
                    .overlay(
                        Circle()
                            .scaleEffect(scale)
                            .opacity(opacity)
                            .foregroundColor(.blue)
                            .animation(.easeOut(duration: 0.6), value: scale)
                    )
            }
        }
    }
}
