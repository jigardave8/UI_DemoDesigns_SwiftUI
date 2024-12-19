//
//  GradientMorphing.swift
//  UI_Demo Design & Functionalities_SwiftUI
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct GradientMorphing: View {
    @State private var startPoint = UnitPoint.topLeading
    @State private var endPoint = UnitPoint.bottomTrailing

    var body: some View {
        LinearGradient(
            gradient: Gradient(colors: [Color.purple, Color.blue, Color.orange]),
            startPoint: startPoint,
            endPoint: endPoint
        )
        .ignoresSafeArea()
        .onAppear {
            withAnimation(
                Animation.easeInOut(duration: 3).repeatForever(autoreverses: true)
            ) {
                startPoint = .bottomTrailing
                endPoint = .topLeading
            }
        }
    }
}
