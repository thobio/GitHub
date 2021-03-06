//
//  DetailsViewController.swift
//  GitHub
//
//  Created by Zerone on 03/02/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

class DetailsViewController: UIViewController {
    
    @IBOutlet weak var navBar: UINavigationBar!
    @IBOutlet weak var viewOne: UIView!
    @IBOutlet weak var viewTwo: UIView!
    @IBOutlet weak var githubDate: UILabel!
    @IBOutlet weak var imageIcon: UIImageView!
    @IBOutlet weak var lblName: UILabel!
    @IBOutlet weak var lblCompnayName: UILabel!
    @IBOutlet weak var lblLocation: UILabel!
    @IBOutlet weak var lblBio: UILabel!
    @IBOutlet weak var btnGitHubPage: UIButton!
    @IBOutlet weak var btnGetFollower: UIButton!
    @IBOutlet weak var lblPublic: UILabel!
    @IBOutlet weak var lblPrivete: UILabel!
    @IBOutlet weak var lblPublicCount: UILabel!
    @IBOutlet weak var lblPrivateCount: UILabel!
    @IBOutlet weak var lblFollower: UILabel!
    @IBOutlet weak var lblFollowing: UILabel!
    @IBOutlet weak var lblFolowerCount: UILabel!
    @IBOutlet weak var lblFollowingCount: UILabel!
    
    let networkCall = NetworkCall()
    var jsonDatas = JSON()
    let alertView = AlertsView()
    var nameString :String = ""
    override func viewDidLoad() {
        super.viewDidLoad()
        uiSetup()
        networkCall.getUser(name: nameString) { (jsonData,isThereError) in
            if isThereError.isEmpty {
                self.jsonDatas = jsonData!
                self.stringFillUI()
            }else{
                self.alertView.showSimpleAlert(message: isThereError, head: "Try Again !", vc: self, buttonName: "Retry")
            }
        }
    }
    func stringFillUI() {
        print(jsonDatas)
        imageIcon.kf.setImage(with: URL(string: jsonDatas["avatar_url"].string ?? ""))
        lblName.text = jsonDatas["name"].string ?? ""
        lblCompnayName.text = jsonDatas["company"].string ?? ""
        lblLocation.text = jsonDatas["location"].string ?? ""
        lblBio.text = jsonDatas["bio"].string ?? ""
        lblPublicCount.text = "\(jsonDatas["public_repos"].int ?? 0)"
        lblPrivateCount.text = "\(jsonDatas["public_gists"].int ?? 0)"
        lblFolowerCount.text = "\(jsonDatas["following"].int ?? 0)"
        lblFollowingCount.text = "\(jsonDatas["followers"].int ?? 0)"
        githubDate.text = "GitHub since \(dateFromStringJsonString(date: jsonDatas["created_at"].string ?? ""))"
    }
    
    func uiSetup(){
        viewOne.viewStyles()
        viewTwo.viewStyles()
        btnGitHubPage.buttonStyleRounded()
        btnGetFollower.buttonStyleRounded()
        navigationItem.rightBarButtonItem?.tintColor = .black
    }
    
    @IBAction func buttonAction(_ sender: UIButton) {
        if sender == btnGitHubPage {
            let vc = GitHubPageViewController()
            vc.githubPageUrl = jsonDatas["html_url"].string!
            self.present(vc, animated: true, completion: nil)
        }else{
            
        }
    }
    @IBAction func dismissButtonAction(_ sender: UIBarButtonItem) {
        self.dismiss(animated: true, completion: nil)
    }
    func dateFromStringJsonString(date:String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        let data = dateFormatter.date(from: date)
        let formatter = DateFormatter()
        formatter.dateFormat = "MMM yyyy"
        return formatter.string(from: data!)
    }
}
