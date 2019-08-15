//
//  Coordinator.swift
//  Coordinator Pattern
//
//  Created by Mark Wong on 14/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import Foundation
import UIKit

protocol Coordinator: AnyObject {
    var childCoordinators: [Coordinator] { get set }
    var navigationController: UINavigationController { get set }
    
    func start()
}
