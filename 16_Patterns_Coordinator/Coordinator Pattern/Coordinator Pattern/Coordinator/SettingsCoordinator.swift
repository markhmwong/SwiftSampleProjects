//
//  SettingsCoordinator.swift
//  Coordinator Pattern
//
//  Created by Mark Wong on 15/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import UIKit

class SettingsCoordinator: NSObject, Coordinator, UINavigationControllerDelegate {
    
    weak var parentCoordinator: MainCoordinator?
    
    var childCoordinators: [Coordinator] = [Coordinator]()
    
    var navigationController: UINavigationController
    
    init(navigationController:UINavigationController) {
        self.navigationController = navigationController
    }
    
    func start() {
        navigationController.delegate = self
        let vc = SettingsViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func startDisplay() {
        let vc = DisplayViewController(coordinator: self)
        navigationController.pushViewController(vc, animated: true)
    }
    
    func childDidFinish(_ child: Coordinator) {
        for (index, coordinator) in childCoordinators.enumerated() {
            if (coordinator === child) {
                childCoordinators.remove(at: index)
                break
            }
        }
    }
    
    func navigationController(_ navigationController: UINavigationController, didShow viewController: UIViewController, animated: Bool) {
        guard let fromViewController = navigationController.transitionCoordinator?.viewController(forKey: .from) else { return }
        
        if navigationController.viewControllers.contains(fromViewController) {
            return
        }
        
        if let displayViewController = fromViewController as? DisplayViewController {
            childDidFinish(displayViewController.coordinator!)
        }
    }
}
