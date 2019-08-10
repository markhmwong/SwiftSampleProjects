//
//  ViewModel.swift
//  14_Patterns_MVVM
//
//  Created by Mark Wong on 10/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import UIKit

class ViewModel: NSObject {
    
    let rowHeight: CGFloat = 50.0

    var tableViewDataSource: [Task]
    
    init(dataSource: [Task]) {
        tableViewDataSource = dataSource
    }
    
}
