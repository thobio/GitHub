//
//  RepoCollectionViewCell.swift
//  GitHub
//
//  Created by Zerone on 10/02/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit

class RepoCollectionViewCell: UICollectionViewCell {
    
    //MARK:- Properties
    
    lazy var gradient : CAGradientLayer = {
        let grd = CAGradientLayer()
        grd.frame = self.bounds
        grd.colors = [UIColor(named:"1st")!.cgColor,UIColor(named: "2nd")!.cgColor]
        return grd
    }()
    
    let lblHead:UILabel = {
       let lbl = UILabel()
        lbl.text = "Head Name"
        lbl.textColor = .white
        let fonts = UIFont(name: "HelveticaNeue-Bold", size: 18)
        lbl.font = fonts
        return lbl
    }()
    
    let lblAboutTheProject:UILabel = {
       let lbl = UILabel()
        lbl.text = "Head Name"
        lbl.numberOfLines = 0
        lbl.textColor = .white
        let fonts = UIFont(name: "HelveticaNeue-Light", size: 13)
        lbl.font = fonts
        return lbl
    }()
    
    let lblLanguage:UILabel = {
          let lbl = UILabel()
          lbl.text = "Swift"
          lbl.textColor = .white
        let fonts = UIFont(name: "HelveticaNeue", size: 14)
        lbl.font = fonts
           return lbl
    }()
    
    lazy var viewBackground:UIView = {
       let view = UIView()
        view.layer.insertSublayer(gradient, at: 0)
        view.layer.cornerRadius = 10.0
        view.clipsToBounds = true
        return view
    }()
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        addSubview(viewBackground)
        viewBackground.addSubview(lblHead)
        viewBackground.addSubview(lblAboutTheProject)
        viewBackground.addSubview(lblLanguage)
        autoLayout()
    }
    func autoLayout(){
        viewBackground.anchor(top: topAnchor, left: leftAnchor, bottom: bottomAnchor, right: rightAnchor,paddingTop: 5.0,paddingLeft: 20.0,paddingBottom: 5.0,paddingRight: 20.0)
        lblHead.anchor(top:viewBackground.topAnchor,left: viewBackground.leftAnchor,right: viewBackground.rightAnchor,paddingTop: 10,paddingLeft: 10,paddingRight: 22.0)
        lblAboutTheProject.anchor(top:lblHead.topAnchor,left: viewBackground.leftAnchor,right: viewBackground.rightAnchor,paddingTop: 20,paddingLeft: 10,paddingBottom: 20,paddingRight: 10,width: bounds.width - 60)
        lblLanguage.anchor(top: lblAboutTheProject.bottomAnchor, left: viewBackground.leftAnchor, bottom: viewBackground.bottomAnchor, right: viewBackground.rightAnchor,paddingLeft: 10, paddingBottom: 10, paddingRight: 10,height: 22.0)
    }
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

