//
//  NetworkCall.swift
//  GitHub
//
//  Created by Zerone on 30/01/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import UIKit
import Alamofire
import SwiftyJSON

class NetworkCall {
    var followers = [Follower]()
    var followeing = [Follower]()
    var repos = [Repo]()
    
    func getUser(name:String,completion: @escaping (JSON?,String) -> ()) {
        let urlStrings = "https://api.github.com/users/" + name
        getNetworkCall(url: urlStrings) { (jsonData, isError) in
            if isError == true {
                completion(JSON(),"Sorry user name \"\(name)\" is not valid")
                return
            }else{
                completion(jsonData!,"")
            }
        }
    }
    
    func getUserWithUser(name:String,completion: @escaping (User) -> ()) {
        let urlStrings = "https://api.github.com/users/" + name
        getNetworkCall(url: urlStrings) { (subJson, isError) in
            if isError == true {
                return
            }else{
                let users = User(login: subJson!["login"].string, id: subJson!["id"].int, nodeID: subJson!["node_id"].string, avatarURL: subJson!["avatar_url"].string, gravatarID: subJson!["gravatar_id"].string, url: subJson!["url"].string, htmlURL: subJson!["html_url"].string, followersURL: subJson!["followers_url"].string, followingURL: subJson!["following_url"].string, gistsURL: subJson!["gists_url"].string, starredURL: subJson!["starred_url"].string, subscriptionsURL: subJson!["subscriptions_url"].string, organizationsURL: subJson!["organizations_url"].string, reposURL: subJson!["repos_url"].string, eventsURL: subJson!["events_url"].string, receivedEventsURL: subJson!["received_events_url"].string, type: subJson!["type"].string, siteAdmin: subJson!["site_admin"].bool, name: subJson!["name"].string, company: subJson!["company"].string, blog: subJson!["blog"].string, location: subJson!["location"].string, email: subJson!["email"].string, hireable: subJson!["hireable"].string, bio: subJson!["bio"].string, publicRepos: subJson!["public_repos"].int, publicGists: subJson!["public_gists"].int, followers: subJson!["followers"].int, following: subJson!["following"].int, createdAt: subJson!["created_at"].string, updatedAt: subJson!["updated_at"].string)
                print(users)
                completion(users)
            }
        }
    }
    
    func getFollowing(name:String,completion: @escaping ([Follower]) -> ()) {
        let urlStrings = "https://api.github.com/users/\(name)/following"
        getNetworkCall(url: urlStrings) { (jsonData, isError) in
            if isError == true {
                return
            }else{
                
                for (_,subJson):(String, JSON) in jsonData! {
                    let follower = Follower(type: subJson["type"].string!, siteAdmin: subJson["site_admin"].bool!, htmlURL: subJson["html_url"].string!, avatarURL: subJson["avatar_url"].string!, gistsURL: subJson["gists_url"].string!, organizationsURL: subJson["organizations_url"].string!, nodeID: subJson["node_id"].string!, gravatarID: subJson["gravatar_id"].string!, subscriptionsURL: subJson["subscriptions_url"].string!, eventsURL: subJson["events_url"].string!, login: subJson["login"].string!, id: subJson["id"].int!, starredURL: subJson["starred_url"].string!, receivedEventsURL: subJson["received_events_url"].string!, followingURL: subJson["following_url"].string!, reposURL: subJson["repos_url"].string!, url: subJson["url"].string!, followersURL: subJson["followers_url"].string!)
                    self.followeing.append(follower)
                }
                completion(self.followeing)
            }
        }
    }
    func getFollowers(name:String,completion: @escaping ([Follower]) -> ()) {
        let urlStrings = "https://api.github.com/users/\(name)/followers"
        getNetworkCall(url: urlStrings) { (jsonData, isError) in
            if isError == true {
                return
            }else{
                for (_,subJson):(String, JSON) in jsonData! {
                    let follower = Follower(type: subJson["type"].string!, siteAdmin: subJson["site_admin"].bool!, htmlURL: subJson["html_url"].string!, avatarURL: subJson["avatar_url"].string!, gistsURL: subJson["gists_url"].string!, organizationsURL: subJson["organizations_url"].string!, nodeID: subJson["node_id"].string!, gravatarID: subJson["gravatar_id"].string!, subscriptionsURL: subJson["subscriptions_url"].string!, eventsURL: subJson["events_url"].string!, login: subJson["login"].string!, id: subJson["id"].int!, starredURL: subJson["starred_url"].string!, receivedEventsURL: subJson["received_events_url"].string!, followingURL: subJson["following_url"].string!, reposURL: subJson["repos_url"].string!, url: subJson["url"].string!, followersURL: subJson["followers_url"].string!)
                    self.followers.append(follower)
                }
                completion(self.followers)
            }
        }
    }
    
    func getRepoList(urls:String,completion: @escaping ([Repo])-> ()){
        getNetworkCall(url: urls) { (jsonData, isError) in
            if isError == true {
                return
            }else{
                for (_,subJson):(String, JSON) in jsonData! {
                    let repo = Repo(name: subJson["name"].string, repoDescription: subJson["description"].string, language: subJson["language"].string)
                    self.repos.append(repo)
                }
                completion(self.repos)
            }
        }
    }
    
    func getNetworkCall(url:String,completion: @escaping (JSON?,Bool) -> ()){
        Alamofire.request(url, method: .get).validate().responseJSON { response in
            switch response.result {
            case .success(let value):
                let json = JSON(value)
                completion(json,false)
            case .failure(let error):
                print(error)
                completion(nil,true)
            }
        }
    }
}
