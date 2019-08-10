//
//  SecondTabViewController.swift
//  SampleUITabView
//
//  Created by Mark Wong on 19/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class SecondTabViewController: ViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.view.backgroundColor = UIColor.blue
        self.navigationItem.title = "Second Tab"
        self.navigationController?.title = "Second"
    }
    
}
