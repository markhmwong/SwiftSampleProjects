//
//  ViewController.swift
//  AnimatedSineWave
//
//  Created by Mark Wong on 11/9/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var pathValuesArr:[CGPath] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        self.bezierA()
//        self.bezierB()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*
        This bezier method computes multiple bezier paths each with varying amplitudes. It animates between these paths to give the illusion of the wave continually changing amplitudes.
     */
    
    func bezierA() {
        let lambda:CGFloat = self.view.frame.width / 2
        let stepAmplitude: Float = 1.0
        let maxAmplitude: Float = 15.0
        let minAmplitude: Float = 10.0
        var currAmplitude: Float = minAmplitude
        var pointArr:[CGPoint] = []
        let sineShapeLayer = CAShapeLayer()
        let origin:CGPoint = CGPoint(x: 0, y: self.view.frame.height / 2)
        let lengthConst:CGFloat = 10.0
        sineShapeLayer.fillColor = UIColor.orange.cgColor
        sineShapeLayer.strokeColor = UIColor.yellow.cgColor
        sineShapeLayer.lineWidth = 5
        
        for amp in stride(from: currAmplitude, through: maxAmplitude, by: stepAmplitude) {
            pointArr = self.defineMainPoints(startPoint: origin, endPoint: CGPoint(x:lambda * lengthConst, y: origin.y), amplitude: CGFloat(amp))
            print(pointArr)
            let path = defineQuadPath(pointArr: pointArr)
            
            sineShapeLayer.path = path.cgPath
            sineShapeLayer.position = CGPoint(x:0, y:self.view.frame.height / 2)
            self.view.layer.addSublayer(sineShapeLayer)
            
            pathValuesArr.append(path.cgPath)
        }
        currAmplitude = maxAmplitude
        print(currAmplitude)
        
        for amp in stride(from: currAmplitude, through: minAmplitude, by: -stepAmplitude) {
            print("running")
            pointArr = self.defineMainPoints(startPoint: origin, endPoint: CGPoint(x:lambda * lengthConst, y: origin.y), amplitude: CGFloat(amp))
            let path = defineQuadPath(pointArr: pointArr)

            sineShapeLayer.path = path.cgPath
            sineShapeLayer.position = CGPoint(x:0, y:self.view.frame.height / 2)
            self.view.layer.addSublayer(sineShapeLayer)

            pathValuesArr.append(path.cgPath)
        }
        let curveAnimation: CAKeyframeAnimation = CAKeyframeAnimation(keyPath: "path")
        curveAnimation.values = pathValuesArr
        curveAnimation.duration = 5
        curveAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        curveAnimation.fillMode = kCAFillModeForwards
        curveAnimation.repeatCount = Float.infinity
        curveAnimation.isRemovedOnCompletion = false
        sineShapeLayer.add(curveAnimation, forKey: "amplitudeAnimation")
        print("drawing complete")


        let phaseShiftAnimation = CAKeyframeAnimation(keyPath: "position.x")
        phaseShiftAnimation.duration = 6
//        phaseShiftAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        phaseShiftAnimation.fillMode = kCAFillModeForwards
        phaseShiftAnimation.isRemovedOnCompletion = false
        phaseShiftAnimation.repeatCount = Float.infinity
        phaseShiftAnimation.values = [sineShapeLayer.position.x - lambda * 7, sineShapeLayer.position.x - lambda]
        sineShapeLayer.add(phaseShiftAnimation, forKey: "phaseShiftAnimation")
        
        let shapeLayerVerticalAnimation = CAKeyframeAnimation(keyPath: "position.y")
        
    }
    
    /*
        BezierB calcultes random amplitudes along 1 path instead of set bezier paths with differing amplitudes. Now we only have to animate along the horizontal axis instead of animating in conjunction with the "path".
    */
    var startingAmplitude: CGFloat = 0.0
    var endingAmplitude: CGFloat = 0.0
    var phaseShiftAnimation = CAKeyframeAnimation()
    let sineShapeLayer = CAShapeLayer()
    var timer: Timer!
    func bezierB() {
        let lambda:CGFloat = self.view.frame.width / 2
        let stepAmplitude: Float = 1.0
        let maxAmplitude: Float = 25.0
        let minAmplitude: Float = 10.0
        var currAmplitude: Float = minAmplitude
        var pointArr:[CGPoint] = []
        let animationDuration:CFTimeInterval = 4.0
        let origin:CGPoint = CGPoint(x: 0, y: self.view.frame.height / 2)
        let lengthOfWaveConst:CGFloat = 10.0
        
        let sineShapeLayer = CAShapeLayer()
        sineShapeLayer.fillColor = UIColor.orange.cgColor
        sineShapeLayer.strokeColor = UIColor.yellow.cgColor
        sineShapeLayer.lineWidth = 3
        
        let stepWave:Float = 1.0
        
        
        pointArr = self.defineMainPointsWithRandomAmplitude(startPoint: CGPoint(x:origin.x, y:origin.y), endPoint: CGPoint(x:lambda * lengthOfWaveConst, y: origin.y))
        print("pointArr: \(pointArr)")
        let path = defineQuadPath(pointArr: pointArr)
        sineShapeLayer.path = path.cgPath
        sineShapeLayer.position = CGPoint(x:0, y:self.view.frame.height / 2)
        self.view.layer.addSublayer(sineShapeLayer)
        pathValuesArr.append(path.cgPath)

        phaseShiftAnimation = CAKeyframeAnimation(keyPath: "position.x")
        phaseShiftAnimation.duration = animationDuration
        //        phaseShiftAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionLinear)
        phaseShiftAnimation.fillMode = kCAFillModeForwards
        phaseShiftAnimation.isRemovedOnCompletion = false
        phaseShiftAnimation.repeatCount = Float.infinity
        phaseShiftAnimation.values = [sineShapeLayer.position.x, sineShapeLayer.position.x - lambda * lengthOfWaveConst]
        sineShapeLayer.add(phaseShiftAnimation, forKey: "phaseShiftAnimation")
        
        timer = Timer.scheduledTimer(timeInterval: 1.5, target: self, selector: #selector(updateWaveValues), userInfo: nil, repeats: true)
    }
    
    @objc func updateWaveValues() {

        var pointArr:[CGPoint] = []
        let lengthOfWaveConst:CGFloat = 10.0
        let lambda:CGFloat = self.view.frame.width / 2
        let origin:CGPoint = CGPoint(x: 0, y: self.view.frame.height / 2)

        pointArr = self.defineMainPointsWithRandomAmplitude(startPoint: CGPoint(x:origin.x, y:origin.y), endPoint: CGPoint(x:lambda * lengthOfWaveConst, y: origin.y))
        let path = defineQuadPath(pointArr: pointArr)
        
        sineShapeLayer.path = path.cgPath
        self.view.layer.addSublayer(sineShapeLayer)
        pathValuesArr.append(path.cgPath)
        phaseShiftAnimation.values = [sineShapeLayer.position.x, sineShapeLayer.position.x - lambda * lengthOfWaveConst]
        sineShapeLayer.add(phaseShiftAnimation, forKey: "phaseShiftAnimation")
    }
    
    /*
     Midpoint
     */
    
    private func defineMidPoint(pointA: CGPoint, pointB: CGPoint) -> CGPoint {
        
        let midX = (pointA.x + pointB.x) / 2
        let midY = (pointA.y + pointB.y) / 2
        
        return CGPoint(x:midX, y:midY)
    }
    
    /*
     control points
     */
    private func defineControlPoint(p1: CGPoint, p2: CGPoint) -> CGPoint {
        var point:CGPoint = defineMidPoint(pointA: p1, pointB: p2)
        let dy:CGFloat = abs(p2.y - point.y)
        
        if (p1.y < p2.y) {
            point.y += dy
        }
        else if (p1.y > p2.y) {
            point.y -= dy
        }
        return point
    }
    

    
    
    /*
     Draw bezier curve
     Works by obtaining the mid point of the mid point. e.g. p0 -> mid(0,1) -> p1. p0 -> mid(0, mid) -> mid
     */
    
    private func defineQuadPath(pointArr: [CGPoint]) -> UIBezierPath {
        let curvePath = UIBezierPath()
        
        curvePath.move(to: pointArr[0])
        var p1 = pointArr[0]
        for i in 1 ..< pointArr.count {
            //define mid point
            
            let p2 = pointArr[i]
            let midPoint = defineMidPoint(pointA: p1, pointB: p2)
            curvePath.addQuadCurve(to: midPoint, controlPoint: defineControlPoint(p1: midPoint, p2: p1))
            curvePath.addQuadCurve(to: p2, controlPoint: defineControlPoint(p1: midPoint, p2: p2))
            p1 = p2
        }
        curvePath.addLine(to: CGPoint(x: p1.x, y:self.view.frame.height * 8))
        curvePath.addLine(to: CGPoint(x: 0, y:self.view.frame.height * 8))
        curvePath.close()

        return curvePath
    }
    
    /*
     Calculates out the points between the start and end of one wavelength
     */
    private func defineMainPoints(startPoint: CGPoint, endPoint: CGPoint, amplitude: CGFloat) -> [CGPoint] {
        let lambda = self.view.frame.width
        let step = lambda / 2
        var pointArr:[CGPoint] = []
        var tempAmp = amplitude
//        pointArr.append(startPoint)
        
        for xPoint in stride(from: startPoint.x, through: endPoint.x, by: step) {
            let newPoint = CGPoint(x:xPoint, y: tempAmp)
            tempAmp = -tempAmp
            pointArr.append(newPoint)
        }
        return pointArr
    }
    
    private func defineMainPointsWithRandomAmplitude(startPoint: CGPoint, endPoint: CGPoint) -> [CGPoint] {
        let lambda = self.view.frame.width
        let step = lambda / 2
        var pointArr:[CGPoint] = []
        
        let maxAmplitude: Float = 40.0
        let minAmplitude: Float = 20.0
        
        var endingAmplitude: CGFloat = 0.0
        var startingAmplitude: CGFloat = 0.0
        
        print("\(pointArr)")
        for xPoint in stride(from: startPoint.x, through: endPoint.x, by: step) {
            print("xPoint: \(xPoint)")
            var randomAmplitude = CGFloat(arc4random_uniform(UInt32(maxAmplitude - minAmplitude)) + UInt32(minAmplitude))
            print(randomAmplitude)
            
            let newPoint = CGPoint(x:xPoint, y: randomAmplitude)
            randomAmplitude = -randomAmplitude
            
            if (startPoint.x == xPoint) {
                startingAmplitude = randomAmplitude
            }
            
            if (endPoint.x == xPoint) {
                endingAmplitude = startingAmplitude
            }
            
            
            pointArr.append(newPoint)
        }
        return pointArr
    }
}

