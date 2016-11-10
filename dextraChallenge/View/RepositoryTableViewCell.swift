//
//  RepositoryTableViewCell.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import UIKit

class RepositoryTableViewCell: UITableViewCell {

    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryInfoLabel: UILabel!
    @IBOutlet weak var repositoryLanguageLabel: UILabel!
    @IBOutlet weak var repositoryStargazersLabel: UILabel!
    @IBOutlet weak var repositoryForksLabel: UILabel!
    
    func fill(repository: Repository){
        repositoryNameLabel.text = repository.fullname
        repositoryStargazersLabel.text = repository.startgazers.stringValue
        repositoryForksLabel.text = repository.forks.stringValue
        
        if let info = repository.info {
            repositoryInfoLabel.text = info
        } else {
            repositoryInfoLabel.text = ""
        }
        
        if let language = repository.language {
            repositoryLanguageLabel.text = language
        } else {
            repositoryLanguageLabel.text = ""
        }
    }

}
