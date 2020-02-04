//
//  ViewController.swift
//  GitHub
//
//  Created by Zerone on 30/01/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit



class ViewController: UIViewController,UITextFieldDelegate {

    @IBOutlet weak var txtUsername: UITextField!
    @IBOutlet weak var btnGetFollowers: UIButton!
    let networkCall = NetworkCall()
    let alertView = AlertsView()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setUpUI()
        self.setUpDelegate()
    }
    
    @IBAction func getFollowersAction(_ sender: UIButton) {
        if txtUsername.text!.isEmpty {
            alertView.showSimpleAlert(message: "Please try again with a \"GitHub\" user name.", head: "Try Again !", vc: self, buttonName: "Retry")
        }else {
            networkCall.getUser(name: txtUsername.text!) { (jsonData,isThereError) in
                if isThereError.isEmpty {
                    self.showDisplayLogin()
                }else{
                    self.alertView.showSimpleAlert(message: isThereError, head: "Try Again !", vc: self, buttonName: "Retry")
                }
            }
        }
    }
    
    func showDisplayLogin() {
        UserDefaults.standard.set(txtUsername.text!, forKey: "name")
            let navController = storyboard?.instantiateViewController(identifier: "navs")
            navController!.modalPresentationStyle = .overFullScreen
            present(navController!, animated: true, completion: nil)
    }
}

extension ViewController {
    func setUpUI(){
        btnGetFollowers.buttonStyleRounded()
        txtUsername.textStyle()
    }
    
    func setUpDelegate() {
        txtUsername.delegate = self
    }
    
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        txtUsername.resignFirstResponder()
        return true
    }
}
