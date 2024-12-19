//
//  LiquidSwipeView.swift
//  UI_Demo Design & Functionalities_SwiftUI
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct LiquidSwipeView: View {
    @State private var offset: CGFloat = UIScreen.main.bounds.width * 0.8
    @State private var isSwiped = false

    var body: some View {
        ZStack {
            Color.blue
                .ignoresSafeArea()

            RoundedRectangle(cornerRadius: isSwiped ? 0 : 80)
                .fill(Color.red)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
                .offset(x: offset)
                .gesture(
                    DragGesture()
                        .onChanged { value in
                            offset = max(0, value.translation.width)
                        }
                        .onEnded { value in
                            withAnimation(.spring(response: 0.5, dampingFraction: 0.6, blendDuration: 0.8)) {
                                if offset > UIScreen.main.bounds.width / 2 {
                                    offset = UIScreen.main.bounds.width
                                    isSwiped = true
                                } else {
                                    offset = 0
                                    isSwiped = false
                                }
                            }
                        }
                )

            if isSwiped {
                Text("Welcome to the Next Page!")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .transition(.move(edge: .trailing))
            }
        }
    }
}
