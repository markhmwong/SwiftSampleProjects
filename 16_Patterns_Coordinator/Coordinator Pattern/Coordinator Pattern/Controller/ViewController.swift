//
//  ViewController.swift
//  Coordinator Pattern
//
//  Created by Mark Wong on 14/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    weak var coordinator: MainCoordinator?
    
    lazy var showSettingsButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Settings", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(settingsHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        view.backgroundColor = .red
        
        // add button to view and layout
        view.addSubview(showSettingsButton)
        showSettingsButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showSettingsButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }

    @objc
    func settingsHandler() {
        coordinator?.showSettings()
    }
    
    
}

