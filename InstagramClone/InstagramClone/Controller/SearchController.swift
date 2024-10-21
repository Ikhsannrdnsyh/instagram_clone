//
//  File2.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 17/10/24.
//

import Foundation
import UIKit


let userCellId = "UserCell"

class SearchController: UITableViewController {
    //MARK: Properties
    private var users = [User]()
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
        fetchUsers()
    }
    
    //MARK: config UI
    private func configureUI(){
        view.backgroundColor = UIColor.white
        tableView.register(UserCell.self, forCellReuseIdentifier: userCellId)
    }
    
    //MARK: API
    private func fetchUsers(){
        UserService.shared.fetchUsers { users in
            self.users = users
            self.tableView.reloadData()
        }
    }
    
}

extension SearchController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return users.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userCellId, for: indexPath) as! UserCell
        cell.user = users[indexPath.row]
        
        return cell
    }
}
