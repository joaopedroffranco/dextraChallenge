//
//  SearchRepositoryTableViewController.swift
//  dextraChallenge
//
//  Created by Joao Pedro Fabiano Franco on 10/11/16.
//  Copyright © 2016 joaopedroffranco. All rights reserved.
//

import UIKit

class SearchRepositoryTableViewController: UITableViewController {
    
    var searchController: UISearchController!
    
    var repositories: [Repository] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureSearchController()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        searchController.searchBar.isHidden = false
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == Identifier.showRepositoryIdentifier){
            let repositoryController = segue.destination as! RepositoryViewController
            repositoryController.repository = sender as! Repository
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
        return repositories.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let repositoryCell = tableView.dequeueReusableCell(withIdentifier: Identifier.repositoryTableViewCellIdentifier, for: indexPath) as! RepositoryTableViewCell
        repositoryCell.fill(repository: repositories[indexPath.row])
        
        return repositoryCell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        searchController.searchBar.isHidden = true
        performSegue(withIdentifier: Identifier.showRepositoryIdentifier, sender: repositories[indexPath.row])
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
       return 100
    }

}

extension SearchRepositoryTableViewController: UISearchBarDelegate {
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar) {
        if (searchBar.text != ""){
            searchController.dismiss(animated: true, completion: nil)
            JSON.parseRepo(withURL: Constant.apiUrl + Constant.repositories + searchBar.text!.joined) { (error, repositories) in
                if error == nil {
                    self.repositories = repositories as! [Repository]
                    
                    DispatchQueue.main.async(execute: {
                        self.tableView.reloadData()
                    })
                }
            }
        }
    }
}
