//
//  DisplayViewController.swift
//  Coordinator Pattern
//
//  Created by Mark Wong on 15/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import UIKit

class DisplayViewController: UIViewController {
    
    weak var coordinator: SettingsCoordinator? = nil
    
    init(coordinator: SettingsCoordinator) {
        self.coordinator = coordinator
        super.init(nibName: nil, bundle: nil)
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Display View Controller - A sub settings viewcontroller")
    }
    
}
