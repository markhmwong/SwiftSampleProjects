//
//  TabViewController.swift
//  SampleUITabView
//
//  Created by Mark Wong on 19/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class TabBarController: UITabBarController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.setupControllers()
        
    }
    
    func setupControllers() {
        
        //init viewcontrollers
        let firstVc = FirstTabViewController()
        let secondVc = SecondTabViewController()
        
        let firstNavController = UINavigationController(rootViewController: firstVc)
        firstNavController.title = "First"
        let secondNavController = UINavigationController(rootViewController: secondVc)
        secondNavController.title = "Second"
        self.viewControllers = [firstNavController, secondNavController]
        
        
    }
    
}
