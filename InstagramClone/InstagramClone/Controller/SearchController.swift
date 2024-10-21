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
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    //MARK: config UI
    private func configureUI(){
        view.backgroundColor = UIColor.white
        tableView.register(UserCell.self, forCellReuseIdentifier: userCellId)
    }
    
}

extension SearchController{
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: userCellId, for: indexPath)
        cell.backgroundColor = .darkGray
        return cell
    }
}
