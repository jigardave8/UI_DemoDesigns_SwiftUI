//
//  MorphingShapeView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct MorphingShapeView: View {
    @State private var isCircle = false
    
    var body: some View {
        RoundedRectangle(cornerRadius: isCircle ? 100 : 20)
            .fill(LinearGradient(gradient: Gradient(colors: [.purple, .orange]), startPoint: .topLeading, endPoint: .bottomTrailing))
            .frame(width: isCircle ? 200 : 300, height: isCircle ? 200 : 300)
            .onTapGesture {
                withAnimation(.easeInOut(duration: 1)) {
                    isCircle.toggle()
                }
            }
    }
}
