//
//  CubeRotationView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct CubeRotationView: View {
    @State private var angle: Double = 0

    var body: some View {
        VStack {
            Spacer()

            ZStack {
                Rectangle()
                    .frame(width: 200, height: 200)
                    .foregroundColor(.blue)
                    .rotation3DEffect(.degrees(angle), axis: (x: 1, y: 0, z: 0))
                    .animation(Animation.linear(duration: 2).repeatForever(autoreverses: false), value: angle)
            }

            Spacer()
        }
        .onAppear {
            angle = 360
        }
    }
}
