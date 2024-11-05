//
//  MainTabController.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 17/10/24.
//

import Foundation
import UIKit
import FirebaseAuth

class MainTabController: UITabBarController{
    //MARK: Vars
    var user: User? {
        didSet {
            guard let user = user else { return }
            configureViewControllers(withUser: user)
        }
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        fetchIsUserLoggedIn()
        fetchUser()
    }
    
    //MARK: Configure UI
    private func configureViewControllers(withUser user: User){
        tabBar.isTranslucent = false
        view.backgroundColor = .white
        
        let feed = templateNavController(unSelectedImage: UIImage(systemName: "house")!, selectedImage: UIImage(systemName: "house.fill")!, viewController: FeedController(collectionViewLayout: UICollectionViewFlowLayout()))
        let search = templateNavController(unSelectedImage: UIImage(systemName: "magnifyingglass.circle")!, selectedImage: UIImage(systemName: "magnifyingglass.circle.fill")!, viewController: SearchController())
        let post = templateNavController(unSelectedImage: UIImage(systemName: "plus.app")!, selectedImage: UIImage(systemName: "plus.app.fill")!, viewController: PostController())
        let notification = templateNavController(unSelectedImage: UIImage(systemName: "heart")!, selectedImage: UIImage(systemName: "heart.fill")!, viewController: NotificationController())
        let profile = templateNavController(unSelectedImage: UIImage(systemName: "person.crop.circle")!, selectedImage: UIImage(systemName: "person.crop.circle.fill")!, viewController: ProfileController(user: user))
        
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
    
    //MARK: API
    func fetchIsUserLoggedIn() {
        if Auth.auth().currentUser == nil {
            DispatchQueue.main.async {
                let controller = LoginController()
                controller.delegate = self
                let nav = UINavigationController(rootViewController: controller)
                nav.modalPresentationStyle = .fullScreen
                self.present(nav, animated: true, completion: nil)
            }
        }
    }
    
    func fetchUser(){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        UserService.shared.fetchUser(withUid: uid) { user in
            self.user = user
        }
    }
}

extension MainTabController: AuthenticationDelegate {
    func authenticationDidComplete() {
        fetchUser()
        self.dismiss(animated: true)
    }
}
