//
//  ViewController.swift
//  14_Patterns_MVVM
//
//  Created by Mark Wong on 10/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // viewModel is refactored into data using protocols
    var data: [CellRepresentable] = [CellRepresentable]()
 
    let cellId = "TaskCellId"
    
    lazy var tableView: UITableView = {
        let view = UITableView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.delegate = self
        view.dataSource = self
        view.backgroundColor = .white
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        setupView()
    }
    
    func setupView() {
        tableView.register(TaskCell.self, forCellReuseIdentifier: cellId)
        view.addSubview(tableView)
        tableView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
    
    func loadData() {
        let numTasks = 4
        for i in 0..<numTasks {
            data.append(ViewModel(task: Task(name: "Task \(i)", createdAt: Date().addingTimeInterval(10.0), isComplete: i % 2 == 0 ? true : false)))
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return data[indexPath.row].rowHeight
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return data.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        return data[indexPath.row].cellInstance(tableView, indexPath: indexPath)
    }
}
