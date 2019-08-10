//
//  ViewController.swift
//  TestCollectionView
//
//  Created by Mark Wong on 23/8/18.
//  Copyright © 2018 Mark Wong. All rights reserved.
//

import UIKit

    class ViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout, UITextFieldDelegate {
        let homeCellId = "homeCellId"
        let worldCellId = "worldCellId"
        
        override func viewDidLoad() {
            super.viewDidLoad()
            self.view.backgroundColor = UIColor.white
            collectionView?.register(HomeCell.self, forCellWithReuseIdentifier: homeCellId)
            collectionView?.register(WorldCell.self, forCellWithReuseIdentifier: worldCellId)
            collectionView?.isPagingEnabled = true
            collectionView?.backgroundColor = UIColor.white
            let notificationCenter = NotificationCenter.default
            notificationCenter.addObserver(self, selector: #selector(self.adjustForKeyboard(notification:)), name: NSNotification.Name.UIKeyboardWillChangeFrame, object: nil)
        
        }

        
        @objc func adjustForKeyboard(notification: Notification) {
            if let userInfo = notification.userInfo, let endFrame = (userInfo[UIKeyboardFrameEndUserInfoKey] as? NSValue)?.cgRectValue {
                
                if (endFrame.origin.y) >= UIScreen.main.bounds.size.height {
                    //self.keyboardHeightLayoutConstraint?.constant = 0.0
                    let contentInsets: UIEdgeInsets = .zero
                    self.collectionView?.contentInset = contentInsets
                    self.collectionView?.scrollIndicatorInsets = contentInsets
                    
                } else {
                    let contentInsets: UIEdgeInsets = UIEdgeInsetsMake(0.0, 0.0, endFrame.size.height+05, 0.0); //05 is padding between your textfield and keypad.
                    self.collectionView?.contentInset = contentInsets
                    self.collectionView?.scrollIndicatorInsets = contentInsets
                }
                self.collectionView?.updateConstraints()
                self.collectionView?.layoutIfNeeded()
            }
        }
        
        override func didReceiveMemoryWarning() {
            super.didReceiveMemoryWarning()
            // Dispose of any resources that can be recreated.
        }

        override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 2
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
            return CGSize(width: view.frame.width, height: view.frame.height)
        }
        
        override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
            print(indexPath.item)
            let identifier: String
            if indexPath.item == 0 {
                identifier = homeCellId
            } else if indexPath.item == 1 {
                identifier = worldCellId
            }
            else {
                identifier = homeCellId
            }
            
            let cell = collectionView.dequeueReusableCell(withReuseIdentifier: identifier, for: indexPath)
            cell.backgroundColor = UIColor.blue
            return cell
        }
        
        func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
            return 0
        }
    }

