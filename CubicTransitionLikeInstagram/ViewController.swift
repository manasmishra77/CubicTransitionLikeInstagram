//
//  ViewController.swift
//  CubicTransitionLikeInstagram
//
//  Created by Manas Mishra on 07/03/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var wrapperCollectionView: WrapperScollerUICollectionView!
    
    var shouldreverse: Bool = false

    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wrapperCollectionView.initialSetUp(delegate: self)
    }
    
    func animateCubic() {
        var t = CATransform3DIdentity
        t.m34 = 1.0 / -500
        t = CATransform3DRotate(t, CGFloat(0.3 * .pi), 0, 1, 0)
        view1.layer.transform = t
    }

    @IBAction func animate(_ sender: Any) {
        if shouldreverse {
            
        } else {
            animateCubic()
        }
    }
    
}

extension ViewController: WrapperScollerUICollectionViewDelgate {
    func numberOfItemFor(collectionView: WrapperScollerUICollectionView) -> Int {
        return 10
    }
    
    func cellForIndex(_ collectionView: WrapperScollerUICollectionView, index: Int) -> UIView {
        let view = UIView()
        view.backgroundColor = UIColor.random()
        return view
    }
    
    func itemSizeForIndex(_ collectionView: WrapperScollerUICollectionView, index: Int) -> CGSize {
        return CGSize.zero
    }
    
    func selectedItemIndex(_ index: Int) {
        
    }
    
    func focusedCellIndex(_ index: Int) {
        
    }
    
    
}

