//
//  ProfileCollectionViewController.swift
//  GitHub
//
//  Created by Zerone on 06/02/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit
import Kingfisher

private let reuseIdentifier = "Cell"
private let headerIdentifer = "ProfileHeader"

class ProfileCollectionViewController: UICollectionViewController,UICollectionViewDelegateFlowLayout {
    
    var jsonUser:User?
    var reposJsonUser:[Repo]?
    let networkCall = NetworkCall()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        getData()
        // Register cell classes
        collectionView!.register(ProfileHeader.self, forSupplementaryViewOfKind:UICollectionView.elementKindSectionHeader, withReuseIdentifier: headerIdentifer)
        collectionView.register(RepoCollectionViewCell.self, forCellWithReuseIdentifier: reuseIdentifier)
        //collectionView.contentInsetAdjustmentBehavior = .never
    }
    
    // MARK: UICollectionViewDataSource

    override func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }


    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return self.reposJsonUser?.count ?? 0
    }

    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: reuseIdentifier, for: indexPath) as! RepoCollectionViewCell
        let repo = self.reposJsonUser![indexPath.row]
        cell.lblHead.text = repo.name
        cell.lblAboutTheProject.text = repo.repoDescription
        cell.lblLanguage.text = repo.language
        return cell
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        return CGSize(width: width, height: 150.0)
    }
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let head = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: headerIdentifer, for: indexPath) as! ProfileHeader
        head.profileImageView.kf.setImage(with:URL(string: (jsonUser?.avatarURL) ?? ""))
        head.namelabel.text = jsonUser?.name
        head.subNamelabel.text = jsonUser?.login
        head.status.text = jsonUser?.company
        head.bio.text = jsonUser?.bio
        return head
    }
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 200)
    }
    func getData(){
        let loginData = UserDefaults.standard.string(forKey:"name")!
        networkCall.getUserWithUser(name: loginData) { (users) in
            self.jsonUser = users
            self.getCellRepo(url: self.jsonUser?.reposURL)
            self.collectionView.reloadData()
        }
    }
    func getCellRepo(url:String?){
        guard let urls = url else {
            return
        }
        networkCall.getRepoList(urls: urls) { (repos) in
            self.reposJsonUser = repos
            self.collectionView.reloadData()
        }
    }
}
