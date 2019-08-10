//
//  FirstTabViewController.swift
//  SampleUITabView
//
//  Created by Mark Wong on 19/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class FirstTabViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.red
        
        self.navigationItem.title = "First Tab"
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    
    
}
