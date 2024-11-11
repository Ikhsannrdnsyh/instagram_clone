//
//  Comment.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 11/11/24.
//

import FirebaseFirestore

struct Comment {
    let uid: String
    let username: String
    let profileImage: String
    let comment: String
    let postOwnerId: String
    let timestamp: Timestamp
    
    init(dictionary: [String: Any]) {
        self.uid = dictionary["uid"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.profileImage = dictionary["profileImage"] as? String ?? ""
        self.comment = dictionary["comment"] as? String ?? ""
        self.postOwnerId = dictionary["postOwnerId"] as? String ?? ""
        self.timestamp = dictionary["timestamp"] as? Timestamp ?? Timestamp(date: Date())
    }
}
