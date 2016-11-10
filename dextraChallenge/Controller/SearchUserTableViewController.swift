//
//  SearchUserTableViewController.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import UIKit

class SearchUserTableViewController: UITableViewController {
    
    var searchController: UISearchController!
    
    var users: [User] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchController.searchBar.isHidden = false
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Identifier.showUserIdentifier){
            let userController = segue.destination as! UserViewController
            userController.user = sender as! User
        }
    }
    
    func configureSearchController() {
        searchController = UISearchController(searchResultsController: nil)
        searchController.searchBar.delegate = self
        searchController.searchBar.placeholder = ""
        searchController.searchBar.sizeToFit()
        
        tableView.tableHeaderView = searchController.searchBar
    }

    // MARK: - Table view data source
    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let userCell = tableView.dequeueReusableCell(withIdentifier: Identifier.userTableViewCellIdentifier, for: indexPath) as! UserTableViewCell
        userCell.fill(user: users[indexPath.row])

        return userCell
    }
    
    override func tableView(_ tableView: UITableView, didEndDisplaying cell: UITableViewCell, forRowAt indexPath: IndexPath) {
        let userCell = cell as! UserTableViewCell
        userCell.sessionAvatar?.cancel()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.searchBar.isHidden = true
        performSegue(withIdentifier: Identifier.showUserIdentifier, sender: users[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }

}

extension SearchUserTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text != ""){
            searchController.dismiss(animated: true, completion: nil)
            JSON.parseUsers(withURL: Constant.apiUrl + Constant.users + searchBar.text!.joined) { (error, users) in
                if error == nil {
                    self.users = users as! [User]
                    
                    DispatchQueue.main.async(execute: {
                        self.tableView.reloadData()
                    })
                }
            }
        }
    }
}
