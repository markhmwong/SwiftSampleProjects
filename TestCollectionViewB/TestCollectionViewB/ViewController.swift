//
//  ViewController.swift
//  TestCollectionViewB
//
//  Created by Mark Wong on 23/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    lazy var collView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let view = UICollectionView(frame: .zero, collectionViewLayout: layout)
        view.dataSource = self
        view.delegate = self
        return view
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
//
//        self.view.backgroundColor = UIColor.darkGray
//        collectionView?.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
//        collectionView?.register(HomeCell.self, forCellWithReuseIdentifier: "homeCellId")
//        collectionView?.backgroundColor = UIColor.blue
//        collectionView?.translatesAutoresizingMaskIntoConstraints = false
//        collectionView?.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
//        collectionView?.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
//        collectionView?.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
//        collectionView?.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
//        collectionView?.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1)
        
        
        self.view.backgroundColor = UIColor.darkGray
        collView.register(UICollectionViewCell.self, forCellWithReuseIdentifier: "cellId")
        collView.register(HomeCell.self, forCellWithReuseIdentifier: "homeCellId")
        self.view.addSubview(collView)
        collView.backgroundColor = UIColor.blue
        collView.translatesAutoresizingMaskIntoConstraints = false
        collView.topAnchor.constraint(equalTo: self.view.topAnchor).isActive = true
        collView.leadingAnchor.constraint(equalTo: self.view.leadingAnchor).isActive = true
        collView.trailingAnchor.constraint(equalTo: self.view.trailingAnchor).isActive = true
        collView.bottomAnchor.constraint(equalTo: self.view.bottomAnchor).isActive = true
        collView.heightAnchor.constraint(equalTo: self.view.heightAnchor, multiplier: 1)
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: self.view.frame.width, height: self.view.frame.height)
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 2
    }
    
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        var identifier: String
        
        if indexPath.item == 0 {
            identifier = "homeCellId"
        }
        else {
            identifier = "cellId"
        }
        
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
        return cell
    }
    
}

