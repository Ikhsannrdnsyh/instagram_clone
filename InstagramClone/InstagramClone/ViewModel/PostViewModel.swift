//
//  PostViewModel.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 05/11/24.
//

import Foundation
import UIKit

struct PostViewModel{
    var post: Post
    
    var profileImageUrl: URL? {
        return URL(string: post.ownerProfileImage)
    }
    
    var username: String {
        return post.ownerUsername
    }
    
    var imageUrl: URL? {
        return URL(string: post.imageUrl)
    }
    
    
    var caption: String {
        return post.caption
    }
    
    var likes: Int {
        return post.likes
    }
    
    var likesText: String {
        return "\(likes) likes"
    }
    
    var timestampText: String?{
        let formatter = DateComponentsFormatter()
        formatter.allowedUnits = [.second, .minute, .hour, .day, .weekOfMonth]
        formatter.maximumUnitCount = 1
        formatter.unitsStyle = .full
        return formatter.string(from: post.timestamp.dateValue(), to: Date())
    }
    
    init(post: Post) {
        self.post = post
    }
}
