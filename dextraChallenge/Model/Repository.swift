//
//  Repository.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 09/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import Foundation

class Repository: NSObject {
    
    var id: NSNumber!
    var name: String!
    var fullName: String?
    var info: String?
    var createdAt: Date!
    var language: String?
    var url: String!
    var score: NSNumber!
    var isPrivate: Bool!
    
    var owner: User!
    
    init(dictionary: [String : Any]){
        self.id = dictionary["id"] as! NSNumber!
        self.name = dictionary["name"] as! String
        self.fullName = dictionary["full_name"] as? String
        self.info = dictionary["description"] as? String
        self.createdAt = Date.date((dictionary["created_at"] as! String))
        self.language = dictionary["language"] as? String
        self.url = dictionary["url"] as! String
        self.score = dictionary["score"] as! NSNumber!
        self.isPrivate = dictionary["private"] as! Bool
        
        self.owner = User(dictionary: dictionary["owner"] as! [String : Any])
    }
    
    class func object(repositoriesDictionary: [[String : Any]]) -> [Repository]{
        var repositories: [Repository] = []
        for repositoryDictionary in repositoriesDictionary {
            repositories.append(Repository(dictionary: repositoryDictionary))
        }
        
        return repositories
    }
    
}
