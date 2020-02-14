//
//  ProfileHeader.swift
//  GitHub
//
//  Created by Zerone on 06/02/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit

class ProfileHeader:UICollectionReusableView {
    
    //MARK:- Properties

    let profileImageView: UIImageView = {
        let iv = UIImageView()
        iv.image = UIImage(named: "11")
        iv.contentMode = .scaleAspectFill
        iv.clipsToBounds = true
        iv.layer.borderWidth = 1
        iv.layer.borderColor = UIColor.gray.cgColor
        iv.layer.cornerRadius = 10.0
        return iv
    }()
    let namelabel:UILabel = {
        let lb = UILabel()
        lb.text = "Thobio Joseph"
        let fonts = UIFont(name: "HelveticaNeue-Bold", size: 25)
        lb.font = fonts
        return lb
    }()
    let subNamelabel:UILabel = {
        let lb = UILabel()
        lb.text = "thobio"
        let fonts = UIFont(name: "HelveticaNeue-Light", size: 14)
        lb.font = fonts
        return lb
    }()
    let status:UILabel = {
        let lb = UILabel()
        lb.text = "status"
        let fonts = UIFont(name: "HelveticaNeue", size: 15)
        lb.font = fonts
        return lb
    }()
    let bio:UILabel = {
        let lb = UILabel()
        lb.text = "status"
        let fonts = UIFont(name: "HelveticaNeue-Light", size: 14)
        lb.font = fonts
        lb.numberOfLines = 0
        return lb
    }()
    let stackView = UIStackView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(profileImageView)
        stackView.addArrangedSubview(namelabel)
        stackView.addArrangedSubview(subNamelabel)
        stackView.addArrangedSubview(status)
        addSubview(stackView)
        addSubview(bio)
        profileImageView.anchor(top:  topAnchor,left: leftAnchor, paddingTop: 20,paddingLeft: 20, width: 120, height: 120)
        stackView.anchor(top: topAnchor, left: profileImageView.rightAnchor,right: rightAnchor, paddingTop: 25, paddingLeft: 10, paddingRight: 10)
        stackView.axis  = NSLayoutConstraint.Axis.vertical
        stackView.distribution  = UIStackView.Distribution.equalSpacing
        stackView.alignment = UIStackView.Alignment.leading
        stackView.spacing   = 8.0
        bio.anchor(top: profileImageView.bottomAnchor, left: leftAnchor, right: rightAnchor, paddingTop: 8, paddingLeft: 30, paddingRight: 30)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
