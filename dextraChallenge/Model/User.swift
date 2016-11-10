//
//  User.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 09/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import Foundation

class Usear: NSObject {
    
    var id: NSNumber!
    var login: String!
    var avatar: String?
    var url: String!
    var score: NSNumber?
    
    init(dictionary: [String : Any]){
        self.id = dictionary["id"] as! NSNumber
        self.login = dictionary["login"] as! String
        self.avatar = dictionary["avatar_url"] as? String
        self.url = dictionary["url"] as! String
        self.score = dictionary["score"] as? NSNumber
    }
    
    
}
