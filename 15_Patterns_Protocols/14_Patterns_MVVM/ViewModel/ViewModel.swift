//
//  ViewModel.swift
//  14_Patterns_MVVM
//
//  Created by Mark Wong on 10/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import UIKit

class ViewModel: NSObject, CellRepresentable {
    
    let rowHeight: CGFloat = 50.0

    var task: Task? = nil

    let cellId = "TaskCellId"
    
    init(task: Task) {
        self.task = task
    }

    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
        cell.task = task
        return cell
    }
    
}
