//
//  UserTableViewCell.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import UIKit

class UserTableViewCell: UITableViewCell {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    
    var sessionAvatar: URLSessionDataTask?
    
    /** Fill cell with user's information
        @param User
    */
    func fill(user: User){
        (_, sessionAvatar) = CacheImage.sharedInstance.image(user.avatar) { (error, image) in
            if error == nil{
                DispatchQueue.main.async(execute: {
                    self.userImageView.image = image
                })
            }
        }
        
        loginLabel.text = user.login
        urlLabel.text = user.url
    }
    

}
