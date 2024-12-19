//
//  SmokeEffectView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct SmokeEffectView: View {
    @State private var touchLocation: CGPoint = .zero

    var body: some View {
        Canvas { context, size in
            context.fill(
                Path(ellipseIn: CGRect(x: touchLocation.x, y: touchLocation.y, width: 50, height: 50)),
                with: .color(.gray.opacity(0.3))
            )
        }
        .frame(width: 300, height: 300)
        .gesture(
            DragGesture()
                .onChanged { value in
                    touchLocation = value.location
                }
        )
    }
}
