//
//  FollowingCollectionViewController.swift
//  GitHub
//
//  Created by Zerone on 30/01/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit
import SwiftyJSON
import Kingfisher

private let reuseIdentifier = "cell"

class FollowingCollectionViewController: UIViewController,UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout {
    
    @IBOutlet weak var collectionViews: UICollectionView!
    
    let networkCall = NetworkCall()
    var jsonDatas = JSON()
    var gitHubUserName : String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViews.delegate = self
        collectionViews.dataSource = self
        gitHubUserName = UserDefaults.standard.string(forKey:"name")!
        networkCall.getFollowing(name: gitHubUserName, completion: { (json) in
            self.jsonDatas = json!
            self.collectionViews.reloadData()
        })
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
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userName = jsonDatas[indexPath.row]["login"].string
        print(userName)
        let vc = storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsViewController
        vc.nameString = userName!
        self.present(vc, animated: true, completion: nil)
        //performSegue(withIdentifier: "details", sender: self)
    }
}
