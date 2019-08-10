//
//  SingleCell.swift
//  SampleCollectionViewInCollectionView
//
//  Created by Mark Wong on 18/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class SingleCell: UICollectionViewCell, UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 10
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = appCollectionView.dequeueReusableCell(withReuseIdentifier: "appCellId", for: indexPath) as! AppCell
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: 80, height: 80)
    }
    
    
    let appCollectionView: UICollectionView = {
        let layout = UICollectionViewFlowLayout()
        layout.scrollDirection = .horizontal
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: layout)
        collectionView.backgroundColor = UIColor.cyan
        
        collectionView.translatesAutoresizingMaskIntoConstraints = false
        return collectionView
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.green
        self.addSubview(appCollectionView)
        self.appCollectionView.dataSource = self
        self.appCollectionView.delegate = self
        appCollectionView.register(AppCell.self, forCellWithReuseIdentifier: "appCellId")
        appCollectionView.topAnchor.constraint(equalTo: self.topAnchor, constant: 10).isActive = true
        appCollectionView.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 10).isActive = true
        appCollectionView.trailingAnchor.constraint(equalTo: self.trailingAnchor, constant: -10).isActive = true

        appCollectionView.bottomAnchor.constraint(equalTo: self.bottomAnchor, constant: -10).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
