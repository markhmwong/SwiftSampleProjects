//
//  DotShape.swift
//  SampleUICoreAnimations
//
//  Created by Mark Wong on 9/9/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class DotShape: CAShapeLayer {
    
    var toPos:CGPoint = CGPoint(x: 0, y: 0)
    var fromPos:CGPoint = CGPoint(x: 0, y:0)
    var origin:CGPoint = CGPoint(x: 0, y:0)
    let pi = CGFloat.pi
    var keyFrameAnimation = CAKeyframeAnimation()
    var animationDuration: CFTimeInterval = 0
        
    override init(layer: Any) {
        super.init(layer: layer)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    init(origin:CGPoint, toPos:CGPoint, fromPos:CGPoint, fill:UIColor, animationDuration: CFTimeInterval) {
        super.init()
        
        self.animationDuration = animationDuration
        self.toPos = toPos
        self.fromPos = fromPos
        self.origin = origin
        self.fillColor = fill.cgColor
        
        self.path = UIBezierPath(arcCenter: self.origin, radius: 10, startAngle: -0.5 * pi, endAngle: 2 * pi, clockwise: true).cgPath
        self.strokeColor = fill.cgColor
        self.lineWidth = 10
        self.strokeEnd = 0
        
        
        DispatchQueue.global(qos: DispatchQoS.QoSClass.default).async {
            self.setupAnimation()
            
            DispatchQueue.main.async {
                print("begin")
                self.beginAnimation()
                
            }
        }
    }
    
    func setupAnimation() {
        keyFrameAnimation = CAKeyframeAnimation(keyPath: "position")
        keyFrameAnimation.values = [fromPos, toPos, fromPos] //animates from the center because the UIBezierPath initialised it with the center value. From there we move from that position to another 50 points on the x axis. and back to the center again. CGPoint(X: 0, y:0) is our "center" or starting point!
        //        keyFrameAnimation.keyTimes = [0, 0.5, 1] // this doesn't seem to be needed just like the sinewave BAFluid example
        keyFrameAnimation.duration = self.animationDuration
        keyFrameAnimation.fillMode = kCAFillModeForwards
        keyFrameAnimation.isRemovedOnCompletion = false
        keyFrameAnimation.isAdditive = false
        keyFrameAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
    }
    
    func beginAnimation() {
        self.add(keyFrameAnimation, forKey: "movingAnimation")
    }
    
    
}
