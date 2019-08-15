//
//  SettingsViewController.swift
//  Coordinator Pattern
//
//  Created by Mark Wong on 14/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import Foundation
import UIKit

class SettingsViewController: UIViewController {
    
    weak var coordinator: SettingsCoordinator?
    
    // sub settings viewcontroller
    lazy var showDisplayButton: UIButton = {
        let button = UIButton(type: .roundedRect)
        button.setTitle("Display", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.addTarget(self, action: #selector(displayHandler), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    init(coordinator: SettingsCoordinator) {
        super.init(nibName: nil, bundle: nil)
        self.coordinator = coordinator
    }
    
    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .blue
        view.addSubview(showDisplayButton)
        showDisplayButton.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
        showDisplayButton.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
    }
    
    @objc
    func displayHandler() {
        coordinator?.startDisplay()
    }
}
