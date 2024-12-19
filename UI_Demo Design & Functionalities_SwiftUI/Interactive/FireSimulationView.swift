//
//  FireSimulationView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

//import SwiftUI
//
//struct FireSimulationView: View {
//    @State private var particles: [Particle] = []
//    
//    var body: some View {
//        ZStack {
//            ForEach(particles) { particle in
//                Circle()
//                    .frame(width: particle.size, height: particle.size)
//                    .foregroundColor(particle.color)
//                    .position(particle.position)
//                    .opacity(particle.opacity)
//                    .animation(.linear(duration: 0.5).repeatForever(autoreverses: false), value: particle.position)
//            }
//        }
//        .onAppear {
//            // Generate particles at the start
//            for _ in 0..<50 {
//                particles.append(Particle())
//            }
//            startTimer()
//        }
//        .onDisappear {
//            // Stop the timer when the view disappears
//            timer?.invalidate()
//        }
//    }
//    
//    @State private var timer: Timer?
//    
//    func startTimer() {
//        // Create a timer to update particles every 0.1 seconds
//        timer = Timer.scheduledTimer(withTimeInterval: 0.1, repeats: true) { _ in
//            updateParticles()
//        }
//    }
//    
//    func updateParticles() {
//        // Update each particle in the array
//        for index in particles.indices {
//            var particle = particles[index]
//            particle.simulate()
//            particles[index] = particle // Update the particle in the array
//        }
//    }
//}
//
//struct Particle: Identifiable {
//    let id = UUID()
//    var position: CGPoint = CGPoint(x: CGFloat.random(in: 0...300), y: CGFloat.random(in: 100...300))
//    var size: CGFloat = CGFloat.random(in: 5...15)
//    var color: Color = Color.orange
//    var opacity: Double = 1.0
//    
//    mutating func simulate() {
//        // Simulate the behavior of the particle
//        position.y -= CGFloat.random(in: 5...10)  // Move upwards
//        opacity -= 0.05  // Decrease opacity over time
//        size += CGFloat.random(in: 1...2)  // Gradually increase the size
//    }
//}
