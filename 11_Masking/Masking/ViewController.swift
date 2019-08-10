//
//  ViewController.swift
//  Masking
//
//  Created by Mark Wong on 21/9/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    let shapeLayer = CAShapeLayer()
    let v = UIView()
    let fillerShape = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shapeLayer.frame = CGRect(x: 0.0, y: 0.0, width: 120.0, height: 120.0)
        shapeLayer.lineWidth = 2.0
        shapeLayer.fillColor = UIColor.black.cgColor
        
        let starPath = UIBezierPath()
        
        let shapeBounds = shapeLayer.bounds
        let center = shapeLayer.position
        
        let numberOfPoints = CGFloat(5.0)
        let numberOfLineSegments = Int(numberOfPoints * 2.0)
        let theta = .pi / numberOfPoints
        
        let circumscribedRadius = center.x
        let outerRadius = circumscribedRadius * 1.039
        let excessRadius = outerRadius - circumscribedRadius
        let innerRadius = CGFloat(outerRadius * 0.382)
        
        let leftEdgePointX = (center.x + cos(4.0 * theta) * outerRadius) + excessRadius
        let horizontalOffset = leftEdgePointX / 2.0
        
        // Apply a slight horizontal offset so the star appears to be more
        // centered visually
        let offsetCenter = CGPoint(x: center.x - horizontalOffset, y: center.y)
        
        // Alternate between the outer and inner radii while moving evenly along the
        // circumference of the circle, connecting each point with a line segment
        for i in 0..<numberOfLineSegments {
            let radius = i % 2 == 0 ? outerRadius : innerRadius
            
            let pointX = offsetCenter.x + cos(CGFloat(i) * theta) * radius
            let pointY = offsetCenter.y + sin(CGFloat(i) * theta) * radius
            let point = CGPoint(x: pointX, y: pointY)
            
            if i == 0 {
                starPath.move(to: point)
            } else {
                starPath.addLine(to: point)
            }
        }
        
        starPath.close()
        
        // Rotate the path so the star points up as expected
        var pathTransform  = CGAffineTransform.identity
        pathTransform = pathTransform.translatedBy(x: center.x, y: center.y)
        pathTransform = pathTransform.rotated(by: CGFloat(-.pi / 2.0))
        pathTransform = pathTransform.translatedBy(x: -center.x, y: -center.y)
        
        starPath.apply(pathTransform)
        shapeLayer.path = starPath.cgPath
        
        
        v.frame = CGRect(x: 50, y: 100, width: 200, height: 200)
//        v.backgroundColor = UIColor.brown
        v.layer.mask = shapeLayer
        v.backgroundColor = UIColor.brown
        self.view.addSubview(v)
        
        let gestureRecogniser = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        v.addGestureRecognizer(gestureRecogniser)
        
        
        let fillerPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: v.bounds.width, height: v.bounds.height))
        fillerShape.frame = v.bounds
        fillerShape.path = fillerPath.cgPath
        fillerShape.fillColor = UIColor.red.cgColor
//        let rotation = 180.0 * (CGFloat.pi / 180)
//        fillerShape.setAffineTransform(CGAffineTransform(rotationAngle: CGFloat.pi))
        v.layer.addSublayer(fillerShape)
    }
    
    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: v)
        //redraw bezier

        let fillerPath = UIBezierPath(rect: CGRect(x: 0, y: 0, width: v.bounds.width, height: location.y))
        fillerShape.path = fillerPath.cgPath
        
        gesture.setTranslation(.zero, in: v) //reset the y translation so it doesn't compound
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

