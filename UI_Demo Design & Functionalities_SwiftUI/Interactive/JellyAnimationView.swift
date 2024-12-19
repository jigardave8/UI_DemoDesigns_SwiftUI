//
//  JellyAnimationView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct JellyAnimationView: View {
    @State private var scale: CGFloat = 1
    @State private var angle: Double = 0

    var body: some View {
        VStack {
            Text("Jelly Bounce")
                .font(.title)
                .padding()

            Button(action: {
                withAnimation(.easeInOut(duration: 0.5)) {
                    scale = 1.2
                    angle += 45
                }
                withAnimation(.easeInOut(duration: 0.5).delay(0.3)) {
                    scale = 1
                }
            }) {
                Text("Press Me")
                    .font(.headline)
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.blue)
                    .cornerRadius(15)
                    .scaleEffect(scale)
                    .rotationEffect(.degrees(angle))
            }
        }
        .frame(maxHeight: .infinity, alignment: .center)
    }
}
