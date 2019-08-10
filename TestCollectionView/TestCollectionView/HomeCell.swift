//
//  HomeCell.swift
//  TestCollectionView
//
//  Created by Mark Wong on 23/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class HomeCell: MyCell {
    let weightField: UITextField = UITextField(frame: .zero)
    
    
    override func setupView() {
        super.setupView()
        print("HomeCell")
        weightField.backgroundColor = UIColor.white
        weightField.translatesAutoresizingMaskIntoConstraints = false
        weightField.keyboardType = UIKeyboardType.default
        self.addSubview(weightField)
        
        weightField.topAnchor.constraint(equalTo: self.topAnchor, constant: 200).isActive = true
        weightField.leadingAnchor.constraint(equalTo: self.leadingAnchor, constant: 50).isActive = true
    }    
}
