//
//  CellRepresentable.swift
//  15_Patterns_Protocols
//
//  Created by Mark Wong on 15/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import UIKit

protocol CellRepresentable {
    var rowHeight: CGFloat { get }
    func cellInstance(_ tableView: UITableView, indexPath: IndexPath) -> UITableViewCell
}
