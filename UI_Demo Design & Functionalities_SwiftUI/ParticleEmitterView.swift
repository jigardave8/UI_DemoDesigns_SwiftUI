//
//  ParticleEmitterView.swift
//  UI_Demo Design & Functionalities_SwiftUI
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct ParticleEmitterView: View {
    @State private var particles = [Particle]()

    var body: some View {
        ZStack {
            ForEach(particles) { particle in
                Circle()
                    .frame(width: particle.size, height: particle.size)
                    .foregroundColor(particle.color)
                    .position(particle.position)
                    .opacity(particle.opacity)
            }
        }
        .onAppear {
            Timer.scheduledTimer(withTimeInterval: 0.05, repeats: true) { _ in
                addParticle()
            }
        }
    }

    func addParticle() {
        let particle = Particle(
            position: CGPoint(x: CGFloat.random(in: 0...UIScreen.main.bounds.width), y: UIScreen.main.bounds.height),
            size: CGFloat.random(in: 5...15),
            color: Color(hue: Double.random(in: 0...1), saturation: 1, brightness: 1),
            opacity: Double.random(in: 0.5...1)
        )
        particles.append(particle)

        withAnimation(.easeOut(duration: 2)) {
            particles = particles.map {
                Particle(position: CGPoint(x: $0.position.x, y: $0.position.y - 200), size: $0.size, color: $0.color, opacity: $0.opacity - 0.5)
            }
        }

        particles.removeAll(where: { $0.opacity <= 0 })
    }
}

struct Particle: Identifiable {
    let id = UUID()
    var position: CGPoint
    var size: CGFloat
    var color: Color
    var opacity: Double
}
