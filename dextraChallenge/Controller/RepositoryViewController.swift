//
//  RepositoryViewController.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import UIKit

class RepositoryViewController: UIViewController {

    @IBOutlet weak var repositoryNameLabel: UILabel!
    @IBOutlet weak var repositoryInfoLabel: UILabel!
    @IBOutlet weak var repositoryLanguageLabel: UILabel!
    @IBOutlet weak var repositoryStargazersLabel: UILabel!
    @IBOutlet weak var repositoryForksLabel: UILabel!
    @IBOutlet weak var privateImageView: UIImageView!
    @IBOutlet weak var usersTableView: UITableView!
    
    var repository: Repository!
    var contributors: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fill()
    }
    
    func fill(){
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
        
        usersTableView.startLoading(style: .gray)
        JSON.parseReposContributors(withURL: repository.contributorsUrl!) { (error, users) in
            if error == nil {
                self.contributors = users as! [User]
                
                DispatchQueue.main.async(execute: {
                    self.usersTableView.reloadData()
                    self.usersTableView.stopLoading()
                })
            } else {
                DispatchQueue.main.async(execute: {
                    self.usersTableView.stopLoading()
                })
            }
        }
    }
}

extension RepositoryViewController: UITableViewDelegate, UITableViewDataSource {
        
        func numberOfSections(in tableView: UITableView) -> Int {
            return 1
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            return contributors.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            let userCell = tableView.dequeueReusableCell(withIdentifier: Identifier.userTableViewCellIdentifier, for: indexPath) as! UserTableViewCell
            userCell.fill(user: contributors[indexPath.row])
            
            return userCell
        }
        
        func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
            let userCell = cell as! UserTableViewCell
            userCell.sessionAvatar?.cancel()
        }
        
        func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
            return 80
        }
        
}

