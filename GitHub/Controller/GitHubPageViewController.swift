//
//  GitHubPageViewController.swift
//  GitHub
//
//  Created by Zerone on 06/02/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit
import WebKit

class GitHubPageViewController: UIViewController {

    var githubPageUrl = ""
    let webView = WKWebView()
    let navBar = UINavigationBar()
    let navItem = UINavigationItem()
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.addSubview(navBar)
        self.view.addSubview(webView)
        navBar.anchor(top: view.topAnchor, left: view.leftAnchor, right: view.rightAnchor, height: 45)
        webView.anchor(top: navBar.bottomAnchor, left: view.leftAnchor, bottom: view.bottomAnchor, right: view.rightAnchor)
        if let url = URL(string: githubPageUrl) {
            let request = URLRequest(url: url)
            webView.load(request)
        }
    }
    
}
