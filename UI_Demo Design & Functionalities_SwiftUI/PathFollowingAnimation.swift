//
//  PathFollowingAnimation.swift
//  UI_Demo 
//
//  Created by BitDegree on 19/12/24.
//

import SwiftUI

struct PathFollowingAnimation: View {
    @State private var position: CGFloat = 0
    
    let path = UIBezierPath()
    
    init() {
        path.move(to: CGPoint(x: 100, y: 100))
        path.addCurve(to: CGPoint(x: 300, y: 100), controlPoint1: CGPoint(x: 150, y: 200), controlPoint2: CGPoint(x: 250, y: 200))
    }
    
    var body: some View {
        ZStack {
            Path(path.cgPath)
                .stroke(Color.gray, lineWidth: 2)
            
            Circle()
                .frame(width: 30, height: 30)
                .foregroundColor(.green)
                .offset(x: pathPoint(position).x, y: pathPoint(position).y)
                .animation(.linear(duration: 2).repeatForever(autoreverses: false), value: position)
        }
        .onAppear {
            position = 1
        }
    }

    func pathPoint(_ progress: CGFloat) -> CGPoint {
        let length = pathLength()
        return pointAtProgress(progress, length: length)
    }
    
    func pathLength() -> CGFloat {
        var length: CGFloat = 0
        let path = self.path.cgPath
        
        path.applyWithBlock { element in
            let points = element.pointee.points
            switch element.pointee.type {
            case .moveToPoint:
                break
            case .addLineToPoint:
                length += points[0].distance(to: points[1])
            case .addQuadCurveToPoint:
                length += points[0].distance(to: points[1]) + points[1].distance(to: points[2])
            case .addCurveToPoint:
                length += points[0].distance(to: points[1]) + points[1].distance(to: points[2]) + points[2].distance(to: points[3])
            case .closeSubpath:
                break
            @unknown default:
                break
            }
        }
        
        return length
    }
    
    func pointAtProgress(_ progress: CGFloat, length: CGFloat) -> CGPoint {
        var targetLength = length * progress
        var currentLength: CGFloat = 0
        var point = CGPoint.zero
        let path = self.path.cgPath
        
        path.applyWithBlock { element in
            let points = element.pointee.points
            switch element.pointee.type {
            case .moveToPoint:
                point = points[0]
            case .addLineToPoint:
                let segmentLength = points[0].distance(to: points[1])
                if currentLength + segmentLength > targetLength {
                    let segmentProgress = (targetLength - currentLength) / segmentLength
                    point = points[0].interpolate(to: points[1], progress: segmentProgress)
                    return
                }
                currentLength += segmentLength
                point = points[1]
            case .addQuadCurveToPoint, .addCurveToPoint:
                // Handle curve interpolation here
                break
            default:
                break
            }
        }
        return point
    }
}

extension CGPoint {
    func distance(to point: CGPoint) -> CGFloat {
        return hypot(x - point.x, y - point.y)
    }
    
    func interpolate(to point: CGPoint, progress: CGFloat) -> CGPoint {
        return CGPoint(x: x + (point.x - x) * progress, y: y + (point.y - y) * progress)
    }
}
