//
//  ViewController.swift
//  Slider
//
//  Created by Mark Wong on 21/9/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    let controlView = UIView()
    let volumeTracker = CAShapeLayer()
    let cornerRadius:CGFloat = 30.0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        controlView.frame = CGRect(x: 100, y: 100, width: 100, height: 300)
        controlView.backgroundColor = UIColor.lightGray
        controlView.layer.cornerRadius = cornerRadius
        controlView.layer.masksToBounds = true
        let rotation = 180.0 * (CGFloat.pi / 180)
        controlView.transform = controlView.transform.rotated(by: rotation)
        self.view.addSubview(controlView)
        
        let gestureRecogniser = UIPanGestureRecognizer(target: self, action: #selector(handlePanGesture))
        controlView.addGestureRecognizer(gestureRecogniser)
        
        let volumePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: controlView.frame.width, height: controlView.frame.height), cornerRadius: cornerRadius)
        volumeTracker.path = volumePath.cgPath
        volumeTracker.fillColor = UIColor.darkGray.cgColor
        controlView.layer.addSublayer(volumeTracker)
    }
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func handlePanGesture(_ gesture: UIPanGestureRecognizer) {
        let location = gesture.location(in: controlView)
        //adjust volume
        
        //redraw bezier
        let volumePath = UIBezierPath(roundedRect: CGRect(x: 0, y: 0, width: controlView.frame.width, height: location.y), cornerRadius: 0)
        volumeTracker.path = volumePath.cgPath
        gesture.setTranslation(.zero, in: controlView) //reset the y translation so it doesn't compound
    }
}

