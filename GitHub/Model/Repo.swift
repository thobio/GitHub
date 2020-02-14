//
//  Repo.swift
//  GitHub
//
//  Created by Zerone on 14/02/20.
//  Copyright © 2020 thobio. All rights reserved.
//

import Foundation
import Alamofire

// MARK: - Repo
class Repo: Codable {
    let name: String?
    let repoDescription: String?
    let language: String?

    enum CodingKeys: String, CodingKey {
        case name
        case repoDescription
        case language
    }

    init(name: String?, repoDescription: String?, language: String?) {
        self.name = name
        self.repoDescription = repoDescription
        self.language = language
    }
}
