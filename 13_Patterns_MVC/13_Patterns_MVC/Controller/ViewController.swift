//
//  ViewController.swift
//  13_Patterns_MVC
//
//  Created by Mark Wong on 10/8/19.
//  Copyright © 2019 Mark Wong. All rights reserved.
//
//  The Controller
//  Typically in a MVC set up, the controller handles the communication between its' containing views and models. This is why you will/may come across viewcontrollers will extensive lines, which makes MVC aka Massive View Controllers.


import UIKit

class ViewController: UIViewController {
    
    let rowHeight: CGFloat = 50.0
    
    let cellId: String = "TaskCellId"
    
    // tableView's datasource
    var taskList: [Task] = []
    
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
            taskList.append(Task(name: "Task \(i)", createdAt: Date().addingTimeInterval(10.0), isComplete: i % 2 == 0 ? true : false))
        }
    }
}

extension ViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return rowHeight
    }
}

extension ViewController: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return taskList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath) as! TaskCell
        cell.task = taskList[indexPath.row]        
        return cell
    }
}
