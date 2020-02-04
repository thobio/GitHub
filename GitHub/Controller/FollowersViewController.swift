//
//  FollowersViewController.swift
//  GitHub
//
//  Created by Zerone on 03/02/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

private let reuseIdentifier = "cell"

class FollowersViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    let networkCall = NetworkCall()
    var jsonDatas = JSON()
    var gitHubUserName : String = ""
    
    @IBOutlet weak var collectionViews: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViews.delegate = self
        collectionViews.dataSource = self
        gitHubUserName = UserDefaults.standard.string(forKey:"name")!
        networkCall.getFollowers(name: gitHubUserName) { (josnData) in
            self.jsonDatas = josnData!
            self.collectionViews.reloadData()
        }

    }
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return jsonDatas.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FollowingCollectionViewCell
        cell.imageView.kf.setImage(with: URL(string: jsonDatas[indexPath.row]["avatar_url"].string!))
        cell.lblName.text = jsonDatas[indexPath.row]["login"].string
        return cell
    }
}
