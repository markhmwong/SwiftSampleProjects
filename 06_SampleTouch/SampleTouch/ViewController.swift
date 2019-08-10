//
//  ViewController.swift
//  SampleTouch - Exploring different touch states, long presses and FSM
//
//  Created by Mark Wong on 21/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

enum FiringState {
    
    case IDLE
    case FINGERDOWN
    case FIRINGSTARTDELAY
    case FIRE
    case INTERVALFIREDELAY
}

class ViewController: UIViewController {

    var currState: FiringState = FiringState.IDLE
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        let longGesture = UILongPressGestureRecognizer(target: self, action: #selector(longTap))
        self.view.addGestureRecognizer(longGesture)
        executeState(state: FiringState.IDLE)
    }
    
    @objc func longTap(_ sender : UIGestureRecognizer) {
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("Touch Began")
        executeState(state: FiringState.FINGERDOWN)
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("Touch ended")
        executeState(state: FiringState.IDLE)
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("Touch Moved")
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
//        print("Touch cancelled")
    }
    
    @objc func fireDelay(_ sender: AnyObject) {
        executeState(state: FiringState.FIRE)
    }
    
    func executeState(state: FiringState) {
        
        switch state {
            case FiringState.FIRE:
                currState = state
                print("Fire")
                break
            case FiringState.FINGERDOWN:
                print("Finger Down")
                executeState(state: FiringState.FIRINGSTARTDELAY)
                currState = state
                break
            case FiringState.IDLE:
                currState = state
                print("Idle")
                break
            case FiringState.FIRINGSTARTDELAY:
                print("Firing after delay")
                Timer.scheduledTimer(timeInterval: 0.5, target: self, selector: #selector(fireDelay(_:)), userInfo: nil, repeats: false)
                break
            default:
                currState = FiringState.IDLE
                print("Idle")
                break
        }
    }
    
    
}

