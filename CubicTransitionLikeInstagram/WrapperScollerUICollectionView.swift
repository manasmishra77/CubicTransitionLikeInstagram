//
//  WrapperScollerUICollectionView.swift
//  CubicTransitionLikeInstagram
//
//  Created by Manas Mishra on 08/03/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

protocol WrapperScollerUICollectionViewDelgate {
    func numberOfItemFor(collectionView: WrapperScollerUICollectionView) -> Int
    func cellForIndex(_ collectionView: WrapperScollerUICollectionView, index: Int) -> UIView
    func itemSizeForIndex(_ collectionView: WrapperScollerUICollectionView,  index: Int) -> CGSize
    func selectedItemIndex(_ index: Int)
    func focusedCellIndex(_ index: Int)
}

class WrapperScollerUICollectionView: UICollectionView {
    var contentSizeOfCollectionview: CGSize {
        return UIScreen.main.bounds.size
    }
    fileprivate var wrapperScrollView: UIScrollView!
    fileprivate var collViewDelegate: WrapperScollerUICollectionViewDelgate!
    fileprivate var cellWidth: CGFloat = 0.0
    private var contentArrayCount: Int = 0

    func initialSetUp(delegate: WrapperScollerUICollectionViewDelgate) {
        let cellNib = UINib.init(nibName: "CubicCollectionViewCell", bundle: nil)
        self.register(cellNib, forCellWithReuseIdentifier: "CubicCollectionViewCell")
        self.isScrollEnabled = false
        if let flowLayout = self.collectionViewLayout as? UICollectionViewFlowLayout {
            flowLayout.sectionInset = UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
        }
        
        self.delegate = self
        self.dataSource = self
        self.collViewDelegate = delegate
        self.reloadData()
        self.layoutIfNeeded()
        
        //Add ScrollView
        let wrapperScrollViewFrame = CGRect(x: 0, y: self.frame.origin.y, width: self.frame.width, height: self.frame.height)
        wrapperScrollView = UIScrollView(frame: wrapperScrollViewFrame)
        self.superview?.addSubview(wrapperScrollView)
        let contentHeight = wrapperScrollView.frame.height
        let contentWidth: CGFloat = cellWidth*CGFloat((self.numberOfItems(inSection: 0)))
        wrapperScrollView.contentSize = CGSize(width: contentWidth, height: contentHeight)
        wrapperScrollView.delegate = self
        wrapperScrollViewInitialSetUp()
    }
    
    func wrapperScrollViewInitialSetUp() {
    }
}

extension WrapperScollerUICollectionView: UICollectionViewDelegate, UICollectionViewDataSource, UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        contentArrayCount = collViewDelegate.numberOfItemFor(collectionView: self)
        
        return contentArrayCount
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CubicCollectionViewCell", for: indexPath) as? CubicCollectionViewCell else {
            return UICollectionViewCell()
        }
        let index = indexPath.row%contentArrayCount
        let mainView = collViewDelegate.cellForIndex(self, index: index)
        mainView.frame = cell.contentCubicView.bounds
        cell.contentCubicView.addSubview(mainView)
        mainView.translatesAutoresizingMaskIntoConstraints = false
        mainView.topAnchor.constraint(equalTo: cell.contentCubicView.topAnchor).isActive = true
        mainView.bottomAnchor.constraint(equalTo: cell.contentCubicView.bottomAnchor).isActive = true
        mainView.leadingAnchor.constraint(equalTo: cell.contentCubicView.leadingAnchor, constant: 0).isActive = true
        mainView.trailingAnchor.constraint(equalTo: cell.contentCubicView.trailingAnchor, constant: 0).isActive = true
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 0
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let cellSize = contentSizeOfCollectionview
        cellWidth = cellSize.width
        return cellSize
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        collViewDelegate.selectedItemIndex(indexPath.row%contentArrayCount)
    }
    
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        self.contentOffset = scrollView.contentOffset
        for cellIndexPath in self.indexPathsForVisibleItems {
            
        }
        
        for cell in self.visibleCells {
            if let cell = cell as? CubicCollectionViewCell {
                let cellOrigin = cell.frame.origin
                let cellOriginAccordingToView = cell.convert(cellOrigin, to: self)
                if cellOriginAccordingToView.x > 5, cellOriginAccordingToView.x < contentSize.width {
                    //Cell is going towrds left
                }
                
            }
        }
    }
    
    //Used for stopping scrolview at specific position
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
            }
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
    }
}

//Requirement related methods
extension WrapperScollerUICollectionView {
   
}

extension CGFloat {
    static func random() -> CGFloat {
        return CGFloat(arc4random()) / CGFloat(UInt32.max)
    }
}
extension UIColor {
    static func random() -> UIColor {
        return UIColor(red:   .random(),
                       green: .random(),
                       blue:  .random(),
                       alpha: 1.0)
    }
}
