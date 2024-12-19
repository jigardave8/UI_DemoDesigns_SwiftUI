//
//  ParallaxScrollView.swift
//  UI_Demo Design & Functionalities_SwiftUI
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct ParallaxScrollView: View {
    let images = ["photo1", "photo2", "photo3"]

    var body: some View {
        ScrollView {
            ForEach(images, id: \.self) { image in
                GeometryReader { geometry in
                    Image(image)
                        .resizable()
                        .frame(width: 50, height: 50, alignment: .center)
                        .clipped()
                        .offset(y: -geometry.frame(in: .global).minY / 2)
                        .scaleEffect(1 + abs(geometry.frame(in: .global).minY) / 1000)
                }
                .frame(width: 50, height: 50, alignment: .center)
            }
        }
//        .ignoresSafeArea(edges: .all)
    }
}
