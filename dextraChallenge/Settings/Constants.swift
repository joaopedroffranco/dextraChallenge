//
//  Constants.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import Foundation

struct Identifier {
    static let userTableViewCellIdentifier = "userTableViewCell"
    static let repositoryTableViewCellIdentifier = "repositoryTableViewCell"
    static let showUserIdentifier = "showUser"
    static let showRepositoryIdentifier = "showRepository"
}

struct Constant {
    static let apiUrl = "https://api.github.com/search/"
    static let repositories = "repositories?q="
    static let users = "users?q="
}
