//
//  Notification.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 17/11/24.
//

import UIKit
import FirebaseFirestore

enum NotificationType: Int {
    case like
    case follow
    case comment
    
    var message: String{
        switch self {
        case .like:
            return " liked your post."
        case .follow:
            return " started Following you"
        case .comment:
            return " commented on your post"
        }
    }
}

struct Notification {
    let id: String
    let uid: String
    let profileImage: String?
    let username: String?
    let postId: String?
    let postImage: String?
    let type: NotificationType
    let timestamp: Timestamp
    
    init(dictionary: [String : Any]) {
        self.id = dictionary["id"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        self.profileImage = dictionary["profileImage"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.postId = dictionary["postId"] as? String ?? ""
        self.postImage = dictionary["postImage"] as? String ?? ""
        self.type = NotificationType(rawValue: dictionary["type"] as? Int ?? 0) ?? .like
        self.timestamp = dictionary["postId"] as? Timestamp ?? Timestamp(date: Date())
    }
}
