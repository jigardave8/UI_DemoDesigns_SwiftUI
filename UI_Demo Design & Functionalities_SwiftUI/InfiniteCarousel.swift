//
//  InfiniteCarousel.swift
//  UI_Demo Design & Functionalities_SwiftUI
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct InfiniteCarousel: View {
    let images = ["photo1", "photo2", "photo3"]
    @State private var currentIndex = 0

    var body: some View {
        GeometryReader { geometry in
            HStack(spacing: 0) {
                ForEach(images.indices, id: \.self) { index in
                    Image(images[index])
                        .resizable()
                        .scaledToFill()
                        .frame(width: geometry.size.width)
                        .clipped()
                }
            }
            .frame(width: geometry.size.width, alignment: .leading)
            .offset(x: -CGFloat(currentIndex) * geometry.size.width)
            .onAppear {
                withAnimation(Animation.linear(duration: 3).repeatForever(autoreverses: false)) {
                    currentIndex = (currentIndex + 1) % images.count
                }
            }
        }
    }
}
