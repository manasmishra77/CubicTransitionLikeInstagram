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
    @IBOutlet weak var leadingView1: NSLayoutConstraint!
    
    @IBOutlet weak var trailingView1: NSLayoutConstraint!
    @IBOutlet weak var sliderToChangeScale: UISlider!
    
    
    @IBOutlet weak var view1: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        wrapperCollectionView.initialSetUp(delegate: self)
        view.backgroundColor = .red
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
    @IBAction func sliderVal(_ sender: UISlider) {
//        let cellOriginX = cell.frame.origin.x
//        let offSetFromScreen = cellOriginX - contentOffSetX
        let scale = sender.value
        let angleToRotate = Double(0.5*scale)*Double.pi
        var t = CATransform3DIdentity
        
        t.m34 = 1.0 / -500
        //t.m34 = 1.0 / -1000
        //view1.layer.anchorPoint = CGPoint(x: 0, y: 0.5)
        
        t = CATransform3DRotate(t, CGFloat(angleToRotate), 0, 1, 0)
        view1.layer.transform = t
        let sccreenWidth = UIScreen.main.bounds.width
        leadingView1.constant = sccreenWidth*CGFloat(scale)
    }
    
}

extension ViewController: WrapperScollerUICollectionViewDelgate {
    func numberOfItemFor(collectionView: WrapperScollerUICollectionView) -> Int {
        return 10
    }
    
    func cellForIndex(_ collectionView: WrapperScollerUICollectionView, index: Int) -> UIView {
        let mainView = UIView(frame: self.view.bounds)
        mainView.backgroundColor = UIColor.random()
        let imageView = UIImageView(frame: mainView.bounds)
        imageView.image = UIImage(named: "nature")
        mainView.addSubview(imageView)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.topAnchor.constraint(equalTo: mainView.topAnchor).isActive = true
        imageView.bottomAnchor.constraint(equalTo: mainView.bottomAnchor).isActive = true
        imageView.leadingAnchor.constraint(equalTo: mainView.leadingAnchor, constant: 0).isActive = true
        imageView.trailingAnchor.constraint(equalTo: mainView.trailingAnchor, constant: 0).isActive = true
        
        return mainView
    }
    
    func itemSizeForIndex(_ collectionView: WrapperScollerUICollectionView, index: Int) -> CGSize {
        return CGSize.zero
    }
    
    func selectedItemIndex(_ index: Int) {
        
    }
    
    func focusedCellIndex(_ index: Int) {
        
    }
    
    
}

