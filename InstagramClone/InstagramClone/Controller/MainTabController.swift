//
//  MainTabController.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 17/10/24.
//

import Foundation
import UIKit

class MainTabController: UITabBarController{
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureViewControllers()
    }
    
    //MARK: COnfigure UI
    
    private func configureViewControllers(){
        let feed = FeedController()
        let search = SearchController()
        let post = PostController()
        let notification = NotificationController()
        let profile = ProfileController()
        
        viewControllers = [feed, search, post, notification, profile]
    }
}
