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
    
    func getFollowing(name:String,completion: @escaping (JSON?) -> ()) {
         let urlStrings = "https://api.github.com/users/\(name)/following"
        getNetworkCall(url: urlStrings) { (jsonData, isError) in
            if isError == true {
                return
            }else{
                print(jsonData!)
                completion(jsonData)
            }
        }
    }
    func getFollowers(name:String,completion: @escaping (JSON?) -> ()) {
         let urlStrings = "https://api.github.com/users/\(name)/followers"
        getNetworkCall(url: urlStrings) { (jsonData, isError) in
            if isError == true {
                return
            }else{
                print(jsonData!)
                completion(jsonData)
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
