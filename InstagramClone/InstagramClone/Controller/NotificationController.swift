//
//  File4.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 17/10/24.
//

import Foundation
import UIKit

private let reuseIdentifier = "NotificationCell"

class NotificationController: UITableViewController {
    //MARK: Properties
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
        
        
    }
    
    //MARK: Config UI
    private func configureUI(){
        view.backgroundColor = .white
        navigationItem.title = "Notifications"
        
        tableView.rowHeight = 60
        tableView.separatorStyle = .none
        tableView.register(NotificationCell.self, forCellReuseIdentifier: reuseIdentifier)
    }
}

//MARK: UITableViewDataSource
extension NotificationController {
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 6
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: reuseIdentifier, for: indexPath) as! NotificationCell
        return cell
    }
}


//MARK: UITAbleViewDelegate
extension NotificationController {
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("DEBUG: Select row \(indexPath.row)")
    }
}
