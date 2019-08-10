//
//  ViewController.swift
//  SampleUIViewWithConstraints - A simple sample iOS project to show 4 UIViews and subclassing with constraints. Without IB!
//
//  Created by Mark Wong on 17/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
//        self.showFullScreenView()
//        self.showFullScreenViewUsinghClosure()
//        self.showFullScreenViewUsingSubclass()
        self.showTwoViewsWithConstraints()
    }
    
    func showFullScreenView() -> Void {
        let fullScreenView = UIView()
        fullScreenView.backgroundColor = UIColor.red
        fullScreenView.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
        view.addSubview(fullScreenView)
    }
    
    func showFullScreenViewUsinghClosure() -> Void {
        let fullScreenView: UIView = {
            let v = UIView()
            v.backgroundColor = UIColor.gray
            v.frame = CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height)
            return v
        }()
        view.addSubview(fullScreenView)
    }
    
    func showFullScreenViewUsingSubclass() -> Void {
        let aFreshView = AFreshView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: view.frame.height))
        view.addSubview(aFreshView)
    }
    
    func showTwoViewsWithConstraints() -> Void {
        
        let topView = ViewWithColor(frame: .zero, bgColor: UIColor.cyan, text: "Top View")
        let bottomView = ViewWithColor(frame: .zero, bgColor: UIColor.brown, text: "Bottom View")
        view.addSubview(topView)
        view.addSubview(bottomView)

        topView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true // half the top view's super view (the viewcontroller) height
        topView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        topView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        topView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
        bottomView.heightAnchor.constraint(equalTo: view.heightAnchor, multiplier: 0.5).isActive = true // half the top view's super view (the viewcontroller) height
        
        bottomView.topAnchor.constraint(equalTo: topView.bottomAnchor).isActive = true //or
//        bottomView.topAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        bottomView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        bottomView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

