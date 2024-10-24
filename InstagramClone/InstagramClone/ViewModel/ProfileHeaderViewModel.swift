//
//  ProfileHeaderViewModel.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 21/10/24.
//

import UIKit

struct ProfileHeaderViewModel {
    let user: User
    
    init(user: User) {
        self.user = user
    }
    
    var fullname: String{
        return user.fullname
    }
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImage)
    }
    
    var followButtonBackgroundColor: UIColor {
        return user.isCurrentUser ? .systemGray5 : .systemBlue
    }
    
    var followButtonTextColor: UIColor {
        return user.isCurrentUser ? .black : .white
    }
    
    var followButtonText: String {
        if user.isCurrentUser {
            return " Edit Profile"
        }
        
        return user.isFollowed ? "Following" : "Follow"
    }
    
    var followersCount: NSAttributedString {
        return attributedStatText(value: user.stats.followers, label: "Follower")
    }
    
    var followingCount: NSAttributedString {
        return attributedStatText(value: user.stats.following, label: "Following")
    }
    
    var postCount: NSAttributedString {
        return attributedStatText(value: 0, label: "Post")
    }
    
    func attributedStatText(value: Int, label: String) -> NSAttributedString {
        let attributedText = NSMutableAttributedString(string: "\(value)\n", attributes: [.font: UIFont.boldSystemFont(ofSize: 14)])
        attributedText.append(NSAttributedString(string: label, attributes: [.font: UIFont.systemFont(ofSize: 14), .foregroundColor: UIColor.lightGray]))
        
        
        return attributedText
    }
    
}
