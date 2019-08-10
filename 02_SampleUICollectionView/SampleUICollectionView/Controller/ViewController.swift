//
//  ViewController.swift
//  SampleUICollectionView - A simple UICollectionView
//
//  1. Build the small cells
//  2. Fix the layout
//  3. build the cells
//
//  Created by Mark Wong on 17/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {

    let cellId = "cellId"
    
    let titles: [String] = ["First Page", "Second Page", "Third Page", "Fourth Page"]
    
    let pages: [WhatsNewPage] = [WhatsNewPage(titleStr: "Track your BAC", descriptionStr: "Monitor your BAC levels while you drink"), WhatsNewPage(titleStr: "Best Drinkers By Country", descriptionStr: "Who'll take this weekends trophy for the best drinker?"), WhatsNewPage(titleStr: "Best Drinkers By Country 3 ", descriptionStr: "Who'll take this weekends trophy for the best drinker?"), WhatsNewPage(titleStr: "Best Drinkers By Country 4 ", descriptionStr: "Who'll take this weekends trophy for the best drinker?")]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        
        //register cell
        collectionView?.register(PageCell.self, forCellWithReuseIdentifier: self.cellId)
        
        collectionView?.backgroundColor = UIColor.green
        collectionView?.isPagingEnabled = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 4
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: self.cellId, for: indexPath) as! PageCell
        
        cell.whatsNewPage = pages[indexPath.item]
//        cell.backgroundColor = .red
        
//        let colorArr: [UIColor] = [UIColor.red, UIColor.green, UIColor.blue, UIColor.black]
//
//        cell.backgroundColor = colorArr[indexPath.item]
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return CGSize(width: view.frame.width, height: view.frame.height)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    
}

