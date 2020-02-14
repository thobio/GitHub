//
//  Follower.swift
//  GitHub
//
//  Created by Zerone on 05/02/20.
//  Copyright © 2020 thobio. All rights reserved.
//
import Foundation
import Alamofire

// MARK: -  Follower
class  Follower: Codable {
    let type: String?
    let siteAdmin: Bool
    let htmlURL: String?
    let avatarURL: String?
    let gistsURL: String?
    let organizationsURL: String?
    let nodeID: String?
    let gravatarID: String?
    let subscriptionsURL: String?
    let eventsURL: String?
    let login: String?
    let id: Int
    let starredURL: String?
    let receivedEventsURL: String?
    let followingURL: String?
    let reposURL: String?
    let url: String?
    let followersURL: String?

    enum CodingKeys: String, CodingKey {
        case type
        case siteAdmin
        case htmlURL
        case avatarURL
        case gistsURL
        case organizationsURL
        case nodeID
        case gravatarID
        case subscriptionsURL
        case eventsURL
        case login, id
        case starredURL
        case receivedEventsURL
        case followingURL
        case reposURL
        case url
        case followersURL
    }

    init(type: String, siteAdmin: Bool, htmlURL: String, avatarURL: String, gistsURL: String, organizationsURL: String, nodeID: String, gravatarID: String, subscriptionsURL: String, eventsURL: String, login: String, id: Int, starredURL: String, receivedEventsURL: String, followingURL: String, reposURL: String, url: String, followersURL: String) {
        self.type = type
        self.siteAdmin = siteAdmin
        self.htmlURL = htmlURL
        self.avatarURL = avatarURL
        self.gistsURL = gistsURL
        self.organizationsURL = organizationsURL
        self.nodeID = nodeID
        self.gravatarID = gravatarID
        self.subscriptionsURL = subscriptionsURL
        self.eventsURL = eventsURL
        self.login = login
        self.id = id
        self.starredURL = starredURL
        self.receivedEventsURL = receivedEventsURL
        self.followingURL = followingURL
        self.reposURL = reposURL
        self.url = url
        self.followersURL = followersURL
    }
}

