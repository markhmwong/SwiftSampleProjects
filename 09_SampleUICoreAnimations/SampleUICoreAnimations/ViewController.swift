//
//  ViewController.swift
//  SampleUICoreAnimations
//
//  Created by Mark Wong on 8/9/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITextFieldDelegate {
    let shakeField = ShakeField(frame: CGRect(x: 100, y: 100, width: 150, height: 30))
    
    var sineShapeLayer: CAShapeLayer = CAShapeLayer()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.runAnimationA() //CABasicAnimation
//        self.runSineWave()
//        self.runSineWaveLayer()
//        self.runAnimationC()
//        self.runAnimationD()
//        self.runAnimationE()
//        self.runAnimationF()
//        self.runAnimationG()
        self.bezierWave()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    //A textfield that shakes upon selection
    func runAnimationA() {
        shakeField.backgroundColor = UIColor.yellow
        shakeField.delegate = self
        self.view.addSubview(shakeField)
    }
    
    //A sine wave
    func runAnimationB() {
        self.view.addSubview(SineView(frame: CGRect(x: 0, y: 100, width: self.view.frame.width, height: 100)))
    }
    
    //Animate the background layer color
    func runAnimationC() {
        let colorKeyframeAnimation = CAKeyframeAnimation(keyPath: "backgroundColor")
        
        colorKeyframeAnimation.values = [UIColor.red.cgColor,
                                         UIColor.green.cgColor,
                                         UIColor.blue.cgColor]
        colorKeyframeAnimation.keyTimes = [0, 0.5, 1]
        colorKeyframeAnimation.duration = 2
        colorKeyframeAnimation.isRemovedOnCompletion = false
        colorKeyframeAnimation.calculationMode = kCAAnimationLinear
        colorKeyframeAnimation.repeatCount = Float.infinity
        colorKeyframeAnimation.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        self.view.layer.add(colorKeyframeAnimation, forKey: "backgroundLayer")
    }
    
    //Animate a circle with a bezier path
    func runAnimationD() {
        
        let shapeLayer = CAShapeLayer()
        let center = view.center
        let pi = CGFloat.pi
        let circularPath = UIBezierPath(arcCenter: center, radius: 100, startAngle: -0.5 * pi, endAngle: 2 * pi, clockwise: true)
        shapeLayer.path = circularPath.cgPath
        shapeLayer.strokeColor = UIColor.yellow.cgColor
        shapeLayer.lineWidth = 10
        shapeLayer.strokeEnd = 0
        shapeLayer.fillColor = UIColor.clear.cgColor
        self.view.layer.addSublayer(shapeLayer)
        
        let basicAnimation = CABasicAnimation(keyPath: "strokeEnd")
        basicAnimation.toValue = 1
        basicAnimation.fromValue = 0
        basicAnimation.duration = 2
        basicAnimation.fillMode = kCAFillModeForwards
        basicAnimation.isRemovedOnCompletion = false
        shapeLayer.add(basicAnimation, forKey: "basic")
        
    }
    
    /*
        A simple black dot moving to a new position and back
     */
    
    func runAnimationE() {
        let dot = DotShape(origin: CGPoint(x:0, y:0), toPos: CGPoint(x: view.center.x,y: 250), fromPos: view.center, fill: UIColor.red, animationDuration: 1)
        self.view.layer.addSublayer(dot)
    }
    
    /*
        A grouped animation. A line traveling between two points and adjusting the stroke length of the line
    */
    func runAnimationF() {
        
        let lineShapeLayer = CAShapeLayer()
        let linePath = UIBezierPath()
        let origin = CGPoint(x: 0, y: self.view.frame.height * 0.50)
        let waveLength = self.view.frame.width
        
        linePath.move(to: origin)
        linePath.addLine(to: CGPoint(x:self.view.frame.width * 0.5, y:self.view.frame.height * 0.50))
        
        UIColor.black.setStroke()
        linePath.stroke()
        
        lineShapeLayer.lineWidth = 10
        lineShapeLayer.path = linePath.cgPath
        lineShapeLayer.strokeColor = UIColor.blue.cgColor
        lineShapeLayer.fillColor = UIColor.clear.cgColor
        lineShapeLayer.strokeEnd = 2
        self.view.layer.addSublayer(lineShapeLayer)
        
        let lineAnimation = CAKeyframeAnimation(keyPath: "strokeEnd")
        lineAnimation.duration = 2
        lineAnimation.values = [1, 0.5]
        lineAnimation.fillMode = kCAFillModeForwards
        
        let posXAnimation = CAKeyframeAnimation(keyPath: "position.x")
        posXAnimation.duration = 2
        posXAnimation.values = [0, 300]
        posXAnimation.fillMode = kCAFillModeForwards

        let animationGroup = CAAnimationGroup()
        animationGroup.duration = 2
        animationGroup.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animationGroup.animations = [lineAnimation, posXAnimation]

        lineShapeLayer.add(animationGroup, forKey: "lineAnimate")
    }
    
    //Amplitude!
    //creates a random range of amplitudes initially into an array
    //then selects at random one of the amplitudes in the array
    /*
        Animating from one sine wave to the next
     */
    func runAnimationG() {
        let sineShapeLayer = CAShapeLayer()
        let origin = CGPoint(x: 0, y: self.view.frame.height * 0.50)
        let waveLength = self.view.frame.width
        let amplitude:CGFloat = 0.1
        let width = self.view.frame.width
        let height = self.view.frame.height
        
//        create two waves inverse of each other
        let waveOnePath = UIBezierPath()
        waveOnePath.move(to: origin)
        for angle in stride(from: 5.0, through: 360.0, by: 5.0) {
            let x = origin.x + CGFloat(angle/360.0) * width
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
            waveOnePath.addLine(to: CGPoint(x: x, y: y))
        }
        
        UIColor.brown.setStroke()
        waveOnePath.stroke()
        
        let waveInversePath = UIBezierPath()
        waveInversePath.move(to:origin)
        for angle in stride(from: 5.0, through: 360.0, by: 5.0) {
            let x = origin.x + CGFloat(angle/360.0) * width
            let y = origin.y - CGFloat(sin(-angle/180.0 * Double.pi)) * height * amplitude
            waveInversePath.addLine(to: CGPoint(x: x, y: y))
        }
        
        UIColor.green.setStroke()
        waveInversePath.stroke()
        
        sineShapeLayer.lineWidth = 5
//        sineShapeLayer.path = waveInversePath.cgPath
        sineShapeLayer.strokeColor = UIColor.green.cgColor
        sineShapeLayer.fillColor = UIColor.clear.cgColor
        
        self.view.layer.addSublayer(sineShapeLayer)
        
        let animateBetweenSineWaves = CAKeyframeAnimation(keyPath: "path")
        animateBetweenSineWaves.values = [waveOnePath.cgPath, waveInversePath.cgPath]
        animateBetweenSineWaves.duration = 2
        animateBetweenSineWaves.timingFunction = CAMediaTimingFunction(name: kCAMediaTimingFunctionEaseInEaseOut)
        animateBetweenSineWaves.fillMode = kCAFillModeForwards
        animateBetweenSineWaves.isRemovedOnCompletion = false
        sineShapeLayer.add(animateBetweenSineWaves, forKey: "morph")
    }
    
    /*
        Drawing a waves using a bezier curve with quadratic curve function (no animation)
     1. Get series of points
     2. find the mid point
     */
    
    func bezierWaveExample() {
        //https://stackoverflow.com/questions/13719143/draw-graph-curves-with-uibezierpath/43813458#43813458
        
        let bezierPath = self.quadCurvedPath(with: [CGPoint(x: 0, y: self.view.frame.height / 2), CGPoint(x: 50, y: -100 + (self.view.frame.height / 2)), CGPoint(x: 200, y: 100 + (self.view.frame.height / 2)), CGPoint(x: 300, y: -100 + (self.view.frame.height / 2))])
        let sineShapeLayer = CAShapeLayer()
        sineShapeLayer.path = bezierPath.cgPath
        sineShapeLayer.strokeColor = UIColor.blue.cgColor
        sineShapeLayer.fillColor = UIColor.clear.cgColor
        self.view.layer.addSublayer(sineShapeLayer)
    }
    
    private func quadCurvedPath(with points:[CGPoint]) -> UIBezierPath {
        let path = UIBezierPath()
        var p1 = points[0]
        
        path.move(to: p1)
        
        if points.count == 2 {
            path.addLine(to: points[1])
            return path
        }
        
        for i in 0..<points.count {
            let mid = midPoint(for: (p1, points[i]))
            path.addQuadCurve(to: mid,
                              controlPoint: controlPoint(for: (mid, p1)))
            path.addQuadCurve(to: points[i],
                              controlPoint: controlPoint(for: (mid, points[i])))
            p1 = points[i]
        }
        return path
    }
    
    
    private func midPoint(for points: (CGPoint, CGPoint)) -> CGPoint {
        return CGPoint(x: (points.0.x + points.1.x) / 2 , y: (points.0.y + points.1.y) / 2)
    }
    
    
    private func controlPoint(for points: (CGPoint, CGPoint)) -> CGPoint {
        var controlPoint = midPoint(for: points)
        let diffY = abs(points.1.y - controlPoint.y)
        
        if points.0.y < points.1.y {
            controlPoint.y += diffY
        } else if points.0.y > points.1.y {
            controlPoint.y -= diffY
        }
        return controlPoint
    }
    /** new implementation ***/
    
    func bezierWave() {
        let lambda = self.view.frame.width / 2
        
        var pointArr:[CGPoint] = []
        
        let origin:CGPoint = CGPoint(x: 0, y: self.view.frame.height / 2)
        
        pointArr = self.defineMainPoints(startPoint: origin, endPoint: CGPoint(x:lambda * 5, y: origin.y))
        
        print(pointArr)
        let path = defineQuadPath(pointArr: pointArr)
        
        let sineShapeLayer = CAShapeLayer()
        sineShapeLayer.path = path.cgPath
        sineShapeLayer.position = CGPoint(x:0, y:self.view.frame.height / 2)
        sineShapeLayer.strokeColor = UIColor.blue.cgColor
        sineShapeLayer.fillColor = UIColor.clear.cgColor
        self.view.layer.addSublayer(sineShapeLayer)
        print("drawing complete")
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
        
        return curvePath
    }
    
    /*
        Works out the points between the start and end
    */
    private func defineMainPoints(startPoint: CGPoint, endPoint: CGPoint) -> [CGPoint] {
        let lambda = self.view.frame.width / 2
        let step = lambda / 2
        var pointArr:[CGPoint] = []
        var amplitude: CGFloat = 20.0// will need to adjust the amplitude
        
        pointArr.append(startPoint)
        
        for xPoint in stride(from: startPoint.x, through: endPoint.x, by: step) {
            let newPoint = CGPoint(x:xPoint, y: amplitude)
            amplitude = -amplitude
            pointArr.append(newPoint)
        }
        
        //temp
        return pointArr
    }
    
    
    /*
        An infinite looping sine wave to mimic water
     */
    
    //Sine wave layer
    func runSineWaveLayer() {
        let amplitude: CGFloat = 0.1
        let width = self.view.frame.width
        let height = self.view.frame.height
        let fixedAmplitude = 20.0
        let origin = CGPoint(x: 0, y: height * 0.50)
        
        let sinePath = UIBezierPath()
        sinePath.move(to: origin)
        for angle in stride(from: 5.0, through: 360.0, by: 5.0) {
            let x = origin.x + CGFloat(angle/360.0) * width
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
            sinePath.addLine(to: CGPoint(x: x, y: y))
        }

        UIColor.black.setStroke()
        sinePath.stroke()
        
        sineShapeLayer.fillColor = UIColor.blue.cgColor
        sineShapeLayer.lineWidth = 10
        sineShapeLayer.strokeColor = UIColor.cyan.cgColor
        sineShapeLayer.path = sinePath.cgPath
        self.view.layer.addSublayer(sineShapeLayer)
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        print("did begin")
        shakeField.shakeAnimation()
    }
    
}

class ShakeField: UITextField {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func shakeAnimation() {
        let animation = CABasicAnimation(keyPath: "position")
        animation.duration = 0.05
        animation.repeatCount = 10
        animation.autoreverses = true
        animation.fromValue = NSValue(cgPoint: CGPoint(x: self.center.x - 4, y: self.center.y))
        animation.toValue = NSValue(cgPoint: CGPoint(x: self.center.x + 4, y: self.center.y))
        self.layer.add(animation, forKey: "position")
    }
    
}

class SineView: UIView{
    let graphWidth: CGFloat = 1  // Graph is 80% of the width of the view
    let amplitude: CGFloat = 0.3   // Amplitude of sine wave is 30% of view height
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = UIColor.yellow
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func draw(_ rect: CGRect) {
        let width = rect.width
        let height = rect.height
        
        let origin = CGPoint(x: width * (1 - graphWidth) / 2, y: height * 0.50)
        
        let path = UIBezierPath()
        path.move(to: origin)
        
        for angle in stride(from: 5.0, through: 360.0, by: 5.0) {
            let x = origin.x + CGFloat(angle/360.0) * width * graphWidth
            let y = origin.y - CGFloat(sin(angle/180.0 * Double.pi)) * height * amplitude
            path.addLine(to: CGPoint(x: x, y: y))
        }
        
        UIColor.black.setStroke()
        path.stroke()
    }
}

