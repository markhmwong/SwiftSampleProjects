//
//  HomeCell.swift
//  TestCollectionViewB
//
//  Created by Mark Wong on 23/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class HomeCell: MyCell {
    
    let text: UITextField = UITextField(frame: CGRect(x: 100, y: 150, width: 50, height: 15))
    override func setupView() {
        super.setupView()
        self.backgroundColor = UIColor.cyan
        print("Home cell")
        text.backgroundColor = UIColor.white
        text.keyboardType = UIKeyboardType.default
        self.addSubview(text)
    }
    
}
