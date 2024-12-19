//
//  PhysicsSimulationView.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI
import SpriteKit

struct PhysicsSimulationView: View {
    var body: some View {
        SpriteView(scene: createScene())
            .frame(width: 300, height: 500)
    }

    func createScene() -> SKScene {
        let scene = SKScene(size: CGSize(width: 300, height: 500))
        scene.backgroundColor = .white
        
        let ball = SKShapeNode(circleOfRadius: 30)
        ball.fillColor = .red
        ball.position = CGPoint(x: 150, y: 450)
        
        scene.addChild(ball)
        
        ball.physicsBody = SKPhysicsBody(circleOfRadius: 30)
        ball.physicsBody?.isDynamic = true
        ball.physicsBody?.affectedByGravity = true
        
        return scene
    }
}
