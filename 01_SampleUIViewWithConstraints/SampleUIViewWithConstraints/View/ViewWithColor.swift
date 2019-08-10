//
//  ViewWithConstraint.swift
//  SampleUIViewWithConstraints
//
//  Created by Mark Wong on 17/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewWithColor: UIView {
    
    var bgColor: UIColor!
    var viewText: String!
    
    init(frame: CGRect, bgColor: UIColor, text: String) {
        super.init(frame: frame)
        
        self.bgColor = bgColor
        self.viewText = text
        self.translatesAutoresizingMaskIntoConstraints = false
        
    }
    
    init() {
        super.init(frame: .zero)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setupView(bgColor: UIColor, text: String) -> Void {
        print("2")
        self.backgroundColor = bgColor
        
        let label: UILabel = {
            let l = UILabel()
            l.text = text
            l.sizeToFit()
            l.frame.origin.x = l.frame.size.width / 2
            l.center = CGPoint(x: (frame.size.width / 2), y: frame.size.height / 2)
            return l
        }()
        
        self.addSubview(label)
    }
    
    /*
 
        Note that because we have initialised the frame rect to be zero, this means the size and position is zero. The important thing to note is the size because our text label is not a fixed size and it depends on the view's frame size. However when we initialised the UIView, it's 0, this means the UILabel will take this value if we call self.setupView() in the init() function. This is why once we have applied the constraints located in the viewcontroller, we override layoutSubviews() and begin our setup there.
     
     */
    override func layoutSubviews() {
        print(self.bgColor)
        self.setupView(bgColor: self.bgColor!, text: self.viewText!)
    }
    
}
