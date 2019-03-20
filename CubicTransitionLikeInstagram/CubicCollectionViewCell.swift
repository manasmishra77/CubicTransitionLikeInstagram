//
//  CubicCollectionViewCell.swift
//  CubicTransitionLikeInstagram
//
//  Created by Manas Mishra on 08/03/19.
//  Copyright © 2019 manas. All rights reserved.
//

import UIKit

class CubicCollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var leadingConstarintContentCubicView: NSLayoutConstraint!
    @IBOutlet weak var trailingConstarintContentCubicView: NSLayoutConstraint!
    @IBOutlet weak var contentCubicView: UIView!
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }
    
    func do3DTransitionToContent(_ scale: CGFloat) {
        contentCubicView.backgroundColor = UIColor.random()
    }

}
