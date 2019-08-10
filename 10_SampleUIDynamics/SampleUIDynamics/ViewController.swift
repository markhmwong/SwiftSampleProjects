//
//  ViewController.swift
//  SampleUIDynamics
//
//  Created by Mark Wong on 8/9/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        var animator: UIDynamicAnimator!
        var gravity: UIGravityBehavior!
        var collision: UICollisionBehavior!
        
        let square = UIView(frame: CGRect(x: 100, y: 100, width: 100, height: 100))
        square.backgroundColor = UIColor.gray
        self.view.addSubview(square)

        
        animator = UIDynamicAnimator(referenceView: view)
        gravity = UIGravityBehavior(items: [square])
        
        animator.addBehavior(gravity)
        
        collision = UICollisionBehavior(items: [square])
        collision.translatesReferenceBoundsIntoBoundary = true
        animator.addBehavior(collision)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

