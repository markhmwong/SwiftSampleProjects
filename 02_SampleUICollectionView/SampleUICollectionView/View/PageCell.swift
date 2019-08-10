//
//  PageCell.swift
//  SampleUICollectionView
//
//  Created by Mark Wong on 17/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class PageCell: UICollectionViewCell {
    
    var whatsNewPage: WhatsNewPage? {
        didSet {
            
            guard let wnp = whatsNewPage else {
                return
            }
            
            
            self.cellTitleStr.text = wnp.titleStr
            self.cellDescriptionStr.text = wnp.descriptionStr
            print("set whats new page")
        }
    }
    var cellTitleStr: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    var cellDescriptionStr: UILabel = {
        let l = UILabel()
        l.translatesAutoresizingMaskIntoConstraints = false
        return l
    }()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        self.backgroundColor = .yellow
        cellTitleStr.sizeToFit()
        cellDescriptionStr.sizeToFit()
        
        self.addSubview(cellTitleStr)
        
        cellTitleStr.topAnchor.constraint(equalTo: self.topAnchor).isActive = true
        cellTitleStr.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellTitleStr.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
        
        self.addSubview(cellDescriptionStr)
        
        cellDescriptionStr.topAnchor.constraint(equalTo: cellTitleStr.bottomAnchor).isActive = true
        cellDescriptionStr.leadingAnchor.constraint(equalTo: self.leadingAnchor).isActive = true
        cellDescriptionStr.trailingAnchor.constraint(equalTo: self.trailingAnchor).isActive = true
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func layoutSubviews() {
        //setup title label
//        self.addSubview(titleLabel)
        
        
        
        
    }
}
