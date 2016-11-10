//
//  UserViewController.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import UIKit

class UserViewController: UIViewController {

    @IBOutlet weak var userImageView: UIImageView!
    @IBOutlet weak var loginLabel: UILabel!
    @IBOutlet weak var urlLabel: UILabel!
    @IBOutlet weak var scoreLabel: UILabel!
    @IBOutlet weak var userRepositoriesTableView: UITableView!
    
    var user: User!
    var userRepositories: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()

        fill()
    }

    func fill(){
        (_, _) = CacheImage.sharedInstance.image(user.avatar) { (error, image) in
            if error == nil{
                DispatchQueue.main.async(execute: {
                    self.userImageView.image = image
                })
            }
        }
        
        loginLabel.text = user.login
        urlLabel.text = user.url
        scoreLabel.text = "Score: \(user.score.stringValue)"
        
        userRepositoriesTableView.startLoading(style: .gray)
        JSON.parseUserRepos(withURL: user.reposUrl!) { (error, repositories) in
            if error == nil {
                self.userRepositories = repositories as! [Repository]
                
                DispatchQueue.main.async(execute: {
                    self.userRepositoriesTableView.reloadData()
                    self.userRepositoriesTableView.stopLoading()
                })
            } else {
                DispatchQueue.main.async(execute: {
                    self.userRepositoriesTableView.stopLoading()
                })
            }
        }
    }
}

extension UserViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return userRepositories.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repositoryCell = tableView.dequeueReusableCell(withIdentifier: Identifier.repositoryTableViewCellIdentifier, for: indexPath) as! RepositoryTableViewCell
        repositoryCell.fill(repository: userRepositories[indexPath.row])
        
        return repositoryCell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
}
