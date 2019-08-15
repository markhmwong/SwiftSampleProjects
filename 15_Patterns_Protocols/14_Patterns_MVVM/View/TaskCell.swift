//
//  TaskCell.swift
//  13_Patterns_MVC
//
//  Created by Mark Wong on 10/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import UIKit

class TaskCell: UITableViewCell {
    
    var task: Task? = nil {
        didSet {
            
            textLabel!.text = task?.name
            
            if (task!.isComplete) {
                textLabel?.textColor = .red
            } else {
                textLabel?.textColor = .black
            }
            
        }
    }
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func prepareForReuse() {
        super.prepareForReuse()
    }
    
}
