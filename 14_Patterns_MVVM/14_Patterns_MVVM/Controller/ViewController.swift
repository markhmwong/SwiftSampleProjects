//
//  ViewController.swift
//  14_Patterns_MVVM
//
//  Created by Mark Wong on 10/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//

import UIKit

import UIKit

class ViewController: UIViewController {
    
    let cellId: String = "TaskCellId"
    
    var viewModel: ViewModel? = nil
    
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
        var dataList: [Task] = []
        for i in 0..<numTasks {
            dataList.append(Task(name: "Task \(i)", createdAt: Date().addingTimeInterval(10.0), isComplete: i % 2 == 0 ? true : false))
        }
        
        viewModel = ViewModel(dataSource: dataList)
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return viewModel!.rowHeight
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel!.tableViewDataSource.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
        cell.task = viewModel!.tableViewDataSource[indexPath.row]
        return cell
    }
}
