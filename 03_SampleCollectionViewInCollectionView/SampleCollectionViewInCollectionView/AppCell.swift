//
//  AppCell.swift
//  SampleCollectionViewInCollectionView
//
//  Created by Mark Wong on 18/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class AppCell: UICollectionViewCell {
    let text:UITextField = UITextField(frame: CGRect(x: 0, y: 1, width: 100, height: 15))
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.backgroundColor = UIColor.darkGray
        self.text.backgroundColor = UIColor.white
        text.keyboardType = UIKeyboardType.default

        self.addSubview(text)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
}
