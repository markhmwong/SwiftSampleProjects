//
//  CustomSlider.swift
//  Slider
//
//  Created by Mark Wong on 21/9/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class CustomSliderRenderer {
    
    let trackLayer = CAShapeLayer()
    let pointerLayer = CAShapeLayer()
    
    init() {
        trackLayer.fillColor = UIColor.blue.cgColor
        pointerLayer.fillColor = UIColor.red.cgColor
        self.drawTrackShape()
        
    }
    
    private func drawTrackShape() {
        let roundedRectPath = UIBezierPath(roundedRect: CGRect(x: 100, y: 100, width: 100, height: 300), cornerRadius: 30.0)
        trackLayer.path = roundedRectPath.cgPath
        
    }
    
}
