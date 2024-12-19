//
//  ContentView.swift
//  UI_Demo Design & Functionalities_SwiftUI
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct DemoAppView: View {
    var body: some View {
        TabView {
            ParticleEmitterView()
                .tabItem {
                    Label("Particle Emitter", systemImage: "sparkles")
                }

            ParallaxScrollView()
                .tabItem {
                    Label("Parallax Effect", systemImage: "arrow.left.and.right.circle.fill")
                }

            LiquidSwipeView()
                .tabItem {
                    Label("Liquid Swipe", systemImage: "circle.dashed")
                }

            CircularPathAnimation()
                .tabItem {
                    Label("Circular Path", systemImage: "circle.fill")
                }

            GradientMorphing()
                .tabItem {
                    Label("Gradient Morphing", systemImage: "paintpalette.fill")
                }

            InfiniteCarousel()
                .tabItem {
                    Label("Infinite Carousel", systemImage: "arrow.2.circlepath")
                }
            MorphingShapeView()
                .tabItem {
                    Label("MorphingShapeView", systemImage: "arrow.2.circlepath")
                }
            CubeRotationView()
                .tabItem {
                    Label("CubeRotationView", systemImage: "arrow.2.circlepath")
                }
            WaveMotionView()
                .tabItem {
                    Label("WaveMotionView", systemImage: "arrow.2.circlepath")
                }
            RippleEffectView()
                .tabItem {
                    Label("RippleEffectView", systemImage: "arrow.2.circlepath")
                }
            NeonGlowView()
                .tabItem {
                    Label("NeonGlowView", systemImage: "arrow.2.circlepath")
                }
            PathFollowingAnimation()
                .tabItem {
                    Label("PathFollowingAnimation", systemImage: "arrow.2.circlepath")
                }
//            LottieAnimationView()
//                .tabItem {
//                    Label("LottieAnimationView", systemImage: "arrow.2.circlepath")
//                }
            PhysicsSimulationView()
                .tabItem {
                    Label("PhysicsSimulationView", systemImage: "arrow.2.circlepath")
                }
            FireworksView()
                .tabItem {
                    Label("FireworksView", systemImage: "arrow.2.circlepath")
                }
            SmokeEffectView()
                .tabItem {
                    Label("SmokeEffectView", systemImage: "arrow.2.circlepath")
                }
            MagneticFieldView()
                .tabItem {
                    Label("MagneticFieldView", systemImage: "arrow.2.circlepath")
                }
            SpringBounceView()
                .tabItem {
                    Label("SpringBounceView", systemImage: "arrow.2.circlepath")
                }
            JellyAnimationView()
                .tabItem {
                    Label("JellyAnimationView", systemImage: "arrow.2.circlepath")
                }
//            FireSimulationView()
//                .tabItem {
//                    Label("FireSimulationView", systemImage: "arrow.2.circlepath")
//                }
            WaterRippleEffect()
                .tabItem {
                    Label("WaterRippleEffect", systemImage: "arrow.2.circlepath")
                }
            FractalView()
                .tabItem {
                    Label("FractalView", systemImage: "arrow.2.circlepath")
                }
            
            
            
            
            
            
            
            
        }
    }
}

struct ContentView: View {
    var body: some View {
        DemoAppView()
        
    }
}
