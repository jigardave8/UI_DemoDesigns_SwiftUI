//
//  WaveMotionView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct WaveMotionView: View {
    @State private var offset: CGFloat = 0

    var body: some View {
        VStack {
            Text("Wave Motion")
                .font(.title)
                .padding()
            
            HStack(spacing: 20) {
                ForEach(0..<5) { _ in
                    Circle()
                        .frame(width: 50, height: 50)
                        .foregroundColor(.blue)
                        .offset(x: offset)
                        .animation(Animation.easeInOut(duration: 1).repeatForever(autoreverses: true), value: offset)
                }
            }
            .onAppear {
                offset = 30
            }
        }
    }
}
