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
    var jsonDatas = [Follower]()
    var gitHubUserName : String = ""
    var tempJson = [Follower]()
    let searchBar = UISearchBar()
    
    @IBOutlet weak var collectionViews: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        collectionViews.delegate = self
        collectionViews.dataSource = self
        searchBar.delegate = self
        searchBarConfigurationUI()
        gitHubUserName = UserDefaults.standard.string(forKey:"name")!
        networkCall.getFollowers(name: gitHubUserName) { (josnData) in
            self.jsonDatas = josnData
            self.tempJson = self.jsonDatas
            self.collectionViews.reloadData()
        }
        
    }
    //MARK:- configurationOfSearchBarUI
    
    func searchBarConfigurationUI(){
        searchBar.sizeToFit()
        searchBar.delegate = self
        showSearchBarButton(shouldShow: true)
    }
    
    @objc func handleShowSearchBar(){
        search(shouldShow: true)
        searchBar.becomeFirstResponder()
        searchBar.becomeFirstResponder()
    }
    
    func showSearchBarButton(shouldShow:Bool){
        if shouldShow {
            navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search,
                                                                target: self,
                                                                action: #selector(handleShowSearchBar))
            navigationItem.rightBarButtonItem?.tintColor = UIColor(named: "Color")
        }else{
            navigationItem.rightBarButtonItem = nil
        }
    }
    
    func search(shouldShow:Bool) {
        showSearchBarButton(shouldShow: !shouldShow)
        searchBar.showsCancelButton = shouldShow
        searchBar.tintColor = UIColor(named: "Color")
        navigationItem.titleView = shouldShow ? searchBar : nil
    }
   func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return tempJson.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! FollowingCollectionViewCell
        cell.imageView.kf.setImage(with: URL(string: tempJson[indexPath.row].avatarURL!))
        cell.lblName.text = tempJson[indexPath.row].login
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let userName = jsonDatas[indexPath.row].login
        let vc = storyboard?.instantiateViewController(withIdentifier: "details") as! DetailsViewController
        vc.nameString = userName!
        self.present(vc, animated: true, completion: nil)
    }
}

extension FollowersViewController :UISearchBarDelegate {
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        search(shouldShow: false)
        tempJson = jsonDatas
        collectionViews.reloadData()
    }
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        filterContentForSearch(searchText: searchText)
        collectionViews.reloadData()
    }
    func filterContentForSearch(searchText:String){
        tempJson.removeAll()
        let search = searchText.lowercased()
        for i in 0..<jsonDatas.count {
            let login = jsonDatas[i].login?.lowercased()
            
            if(login!.contains(search)) {
                tempJson.append(jsonDatas[i])
            }else{
                
            }
        }
    }
}
