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
    
    //MARK: Configure UI
    private func configureViewControllers(){
        
        let feed = templateNavController(unSelectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill")!, viewController: FeedController())
        let search = templateNavController(unSelectedImage: UIImage(systemName: "magnifyingglass.circle")!, selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")!, viewController: SearchController())
        let post = templateNavController(unSelectedImage: UIImage(systemName: "plus.app")!, selectedImage: UIImage(systemName: "plus.app.fill")!, viewController: PostController())
        let notification = templateNavController(unSelectedImage: UIImage(systemName: "heart")!, selectedImage: UIImage(systemName: "heart.fill")!, viewController: NotificationController())
        let profile = templateNavController(unSelectedImage: UIImage(systemName: "person.crop.circle")!, selectedImage: UIImage(systemName: "person.crop.circle.fill")!, viewController: ProfileController())
        
        viewControllers = [feed, search, post, notification, profile]
        
        tabBar.tintColor = .black
    }
    
    private func templateNavController(unSelectedImage: UIImage, selectedImage: UIImage, viewController: UIViewController) -> UINavigationController{
        let nav = UINavigationController(rootViewController: viewController)
        nav.tabBarItem.image = unSelectedImage
        nav.tabBarItem.selectedImage = selectedImage
        nav.navigationBar.tintColor = .black
        
        return nav
    }
}
