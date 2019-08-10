//
//  ViewController.swift
//  SampleTableView
//
//  Created by Mark Wong on 19/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UITableViewController {

    let cellId: String = "cellId"
    let names = ["mark", "michael", "sally", "billy", "rose", "chereen"]
    
    var showIndexState = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        
        self.navigationItem.title = "Contacts"
        self.navigationController?.navigationBar.prefersLargeTitles = true
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: cellId)
        
        self.navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Show Index", style: .plain, target: self, action: #selector(handleShowIndexPath))
        
    }

    @objc func handleShowIndexPath() {
        
        let indexPath = IndexPath(row: 0, section: 0)
        
        let rowAnimation = showIndexState ? UITableViewRowAnimation.left : UITableViewRowAnimation.right
        
        showIndexState = !showIndexState
        for (index, _) in names.enumerated() {
            
            print(index)
            let indexPath = IndexPath(row: index, section: 0)
            
            tableView.reloadRows(at: [indexPath], with: rowAnimation)
        }
        
        
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return names.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = self.tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        cell.backgroundColor = UIColor.orange
        
        
        if showIndexState {
            cell.textLabel?.text = "\(names[indexPath.item]):Item:\(indexPath.item)Row:\(indexPath.row)"
        }
        else {
            cell.textLabel?.text = "\(names[indexPath.item])"
        }
        
        cell.textLabel?.textColor = UIColor.white
        return cell
    }
    
}

class CustomNameCell: UITableViewCell {
    
    
}
