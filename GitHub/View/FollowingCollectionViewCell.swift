//
//  FollowingCollectionViewCell.swift
//  GitHub
//
//  Created by Zerone on 30/01/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit

class FollowingCollectionViewCell: UICollectionViewCell {
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        self.contentView.backgroundColor = UIColor(named:"TextBackGroundColor")
        self.contentView.layer.cornerRadius = 5.0
        self.contentView.viewStyle()
    }
}
