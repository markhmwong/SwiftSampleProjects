//
//  MyCell.swift
//  TestCollectionView
//
//  Created by Mark Wong on 23/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class MyCell: UICollectionViewCell {
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
    }
    
    
}
