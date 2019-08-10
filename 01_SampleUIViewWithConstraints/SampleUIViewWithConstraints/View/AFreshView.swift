//
//  AFreshView.swift
//  SampleUIViewWithConstraints
//
//  Created by Mark Wong on 17/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class AFreshView: UIView {
    
    var freshLabel: UILabel = UILabel()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        self.setupView()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView() {
        
        self.backgroundColor = UIColor.green
        
        freshLabel.text = "My Fresh Label"
        freshLabel.textAlignment = .left
        freshLabel.font = UIFont.boldSystemFont(ofSize: 40)
        freshLabel.sizeToFit() //this is required to be called before you set the position. As the rect for the label has not been calculated until this is called.
        freshLabel.frame.origin.x = freshLabel.frame.size.width / 2
        freshLabel.center = CGPoint(x: (frame.size.width / 2), y: frame.size.height / 2)        
        self.addSubview(freshLabel)
        
        
    }
}
