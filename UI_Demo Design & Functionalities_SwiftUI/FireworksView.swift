//
//  FireworksView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct FireworksView: View {
    @State private var showFireworks = false

    var body: some View {
        VStack {
            Text("Tap to Launch Fireworks")
                .font(.title)
                .padding()

            Button(action: {
                showFireworks.toggle()
            }) {
                Text("Launch")
                    .padding()
                    .background(Color.blue)
                    .foregroundColor(.white)
                    .cornerRadius(10)
            }

            if showFireworks {
                FireworksAnimation()
            }
        }
    }
}

struct FireworksAnimation: View {
    @State private var offset: CGFloat = 0

    var body: some View {
        VStack {
            ForEach(0..<10) { _ in
                Circle()
                    .frame(width: 10, height: 10)
                    .foregroundColor(.yellow)
                    .offset(y: offset)
                    .animation(Animation.easeInOut(duration: 0.5).repeatForever(autoreverses: true), value: offset)
            }
        }
        .onAppear {
            offset = -100
        }
    }
}
