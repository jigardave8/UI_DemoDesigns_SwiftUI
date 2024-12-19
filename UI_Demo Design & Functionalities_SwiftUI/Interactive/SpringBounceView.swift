//
//  SpringBounceView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct SpringBounceView: View {
    @State private var bounceValue1: CGFloat = 0
    @State private var bounceValue2: CGFloat = 0
    @State private var bounceValue3: CGFloat = 0

    var body: some View {
        VStack {
            VStack(spacing: 20) {
                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.blue)
                    .offset(y: bounceValue1)
                    .animation(.interpolatingSpring(stiffness: 100, damping: 5).repeatForever(autoreverses: false), value: bounceValue1)

                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.green)
                    .offset(y: bounceValue2)
                    .animation(.interpolatingSpring(stiffness: 80, damping: 7).repeatForever(autoreverses: false), value: bounceValue2)

                Circle()
                    .frame(width: 100, height: 100)
                    .foregroundColor(.orange)
                    .offset(y: bounceValue3)
                    .animation(.interpolatingSpring(stiffness: 120, damping: 6).repeatForever(autoreverses: false), value: bounceValue3)
            }
            .onAppear {
                bounceValue1 = 30
                bounceValue2 = 60
                bounceValue3 = 90
            }
        }
        .frame(height: 400)
    }
}
