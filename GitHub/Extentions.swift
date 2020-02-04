//
//  Extentions.swift
//  GitHub
//
//  Created by Zerone on 30/01/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit

extension UIButton {
    
    func buttonStyleRounded() {
        self.layer.cornerRadius = 5.0
    }
    
}

extension UITextField {
    
    func textStyle() {
        self.layer.cornerRadius = 5.0
        self.layer.borderWidth = 1.0
        self.layer.borderColor = UIColor.systemGray5.cgColor
    }
    
}

extension UIView {
    func viewStyle(){
        self.layer.cornerRadius = 5.0
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowColor = UIColor.systemGray5.cgColor
        self.layer.shadowOpacity = 0.45
    }
    func viewStyles(){
        self.layer.cornerRadius = 10.0
        self.layer.shadowRadius = 2
        self.layer.shadowOffset = CGSize(width: 1, height: 2)
        self.layer.shadowColor = UIColor.systemGray5.cgColor
        self.layer.shadowOpacity = 0.45
    }
}
