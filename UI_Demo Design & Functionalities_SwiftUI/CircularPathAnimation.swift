//
//  CircularPathAnimation.swift
//  UI_Demo Design & Functionalities_SwiftUI
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct CircularPathAnimation: View {
    @State private var progress: CGFloat = 0.0

    var body: some View {
        ZStack {
            Circle()
                .stroke(lineWidth: 20)
                .opacity(0.3)
                .foregroundColor(.blue)

            Circle()
                .trim(from: 0, to: progress)
                .stroke(
                    AngularGradient(
                        gradient: Gradient(colors: [.red, .yellow, .green]),
                        center: .center
                    ),
                    style: StrokeStyle(lineWidth: 20, lineCap: .round)
                )
                .rotationEffect(.degrees(-90))
                .animation(.easeInOut(duration: 2), value: progress)

            Button("Animate") {
                progress = 1.0
            }
            .buttonStyle(.borderedProminent)
            .padding(50)
        }
        .frame(width: 200, height: 200)
    }
}
