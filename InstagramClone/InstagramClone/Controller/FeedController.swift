//
//  File.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 17/10/24.
//

import Foundation
import UIKit

class FeedController: UICollectionViewController {
    //MARK: Properties
    private var posts: [Post] = []
    var post: Post?
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureUI()
        fetchPosts()
    }
    
    //MARK: Configure UI
    private func ConfigureUI(){
        collectionView.backgroundColor = .white
        
        collectionView.register(FeedCell.self, forCellWithReuseIdentifier: "Cell")
        
        if post == nil {
            navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Logout", style: .plain, target: self, action: #selector(onTapLogout))
        }
        
        let refresher = UIRefreshControl()
        refresher.addTarget(self, action: #selector(onTapRefresh), for: .valueChanged)
        collectionView.refreshControl = refresher

    }
    
    //MARK: Actions
    @objc
    private func onTapLogout(){
        AuthService.shared.logoutUser()
        let controller = LoginController()
        controller.delegate = self.tabBarController as? MainTabController
        let nav = UINavigationController(rootViewController: controller)
        nav.modalPresentationStyle = .fullScreen
        self.present(nav, animated: true, completion: nil)
    }
    
    @objc
    func onTapRefresh(){
        fetchPosts()
    }
    
    //MARK: API
    private func fetchPosts(){
        guard post == nil else { return }
        
        PostService.shared.fecthPosts { posts in
            self.posts = posts
            self.collectionView.reloadData()
            self.collectionView.refreshControl?.endRefreshing()
            
//            posts.forEach { post in
//                print("Post Data: \(post)")
//            }
        }
    }
}

//MARK: UICollectionView Data Source
extension FeedController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return post == nil ? posts.count : 1
    }
     
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "Cell", for: indexPath) as! FeedCell
        
        cell.delegate = self
        
        if let post = post {
            cell.viewModel = PostViewModel(post: post)
        } else {
            cell.viewModel = PostViewModel(post: self.posts[indexPath.row])
        }
        return cell
    }
}

//MARK: UICollectionViewDelegateFlowLayout
extension FeedController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = view.frame.width
        var height = width + 12 + 40 + 8
        height += 50
        height += 60
        
        return CGSize(width: width, height: height)
    }
}

extension FeedController: FeedCellDelegate {
    func call(_ cell: FeedCell, showCommentsFor post: Post) {
        let controller = CommentController(post: post)
        navigationController?.pushViewController(controller, animated: true)
    }
    
    
}

