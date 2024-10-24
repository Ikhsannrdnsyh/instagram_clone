//
//  File5.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 17/10/24.
//

import Foundation
import UIKit
import FirebaseAuth

class ProfileController: UICollectionViewController {
    //MARK: Vars
    private var user: User {
        didSet { collectionView.reloadData() }
    }
    
    init(user: User) {
        self.user = user
        super.init(collectionViewLayout: UICollectionViewFlowLayout())
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    //MARK: Life cycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ConfigureUI()
        fetchIsUserFollowed()
    }
    
    //MARK: API
    private func fetchIsUserFollowed(){
        UserService.shared.isUserFollowed(uid: user.uid) { isFollowed in
            self.user.isFollowed = isFollowed
        }
    }
    
    //MARK: Configure UI
    private func ConfigureUI(){
        collectionView.backgroundColor = .white
        
        self.navigationItem.title = user.username
        collectionView.register(ProfileCell.self, forCellWithReuseIdentifier: "ProfileCell")
        collectionView.register(ProfileHeader.self, forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader, withReuseIdentifier: "ProfileHeader")

    }
}

//MARK: UICOllectionViewDataSource
extension ProfileController{
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 9
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "ProfileCell", for: indexPath) as! ProfileCell
        return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let header = collectionView.dequeueReusableSupplementaryView(ofKind: kind, withReuseIdentifier: "ProfileHeader", for: indexPath) as! ProfileHeader
        header.viewModel = ProfileHeaderViewModel(user: user)
        header.delegate = self
        
        return header
    }
}

//MARK: UICOllectionViewDelegate
extension ProfileController{
    
}

//MARK: UICOllectionViewDelegateFlowLayout
extension ProfileController: UICollectionViewDelegateFlowLayout{
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (view.frame.width - 2) / 3
        return CGSize( width: width, height: width)
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: view.frame.width, height: 240)
    }
}

//MARK: ProfileHeaderDelegate
extension ProfileController: ProfileHeaderDelegate {
    func header(_ header: ProfileHeader, onTapButtonFor user: User) {
        
        if user.isCurrentUser {
            print("DEBUG: Edit Profile")
        } else {
            if user.isFollowed{
                UserService.shared.unFollow(uid: user.uid) { error in
                    self.user.isFollowed = false
                }
            } else {
                UserService.shared.follow(uid: user.uid ) { error in
                    self.user.isFollowed = true
                }
            }
        }
    }
}
