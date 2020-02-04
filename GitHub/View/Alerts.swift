//
//  Alerts.swift
//  GitHub
//
//  Created by Zerone on 03/02/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit

class AlertsView {
    func showSimpleAlert(message:String,head:String,vc:UIViewController,buttonName:String) {
        let alert = UIAlertController(title: head, message: message,preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: buttonName, style: .default, handler: { _ in
           }))
           vc.present(alert, animated: true, completion: nil)
    }
}
