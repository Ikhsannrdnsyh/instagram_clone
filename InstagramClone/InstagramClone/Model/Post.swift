//
//  Post.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 05/11/24.
//

import Foundation
import UIKit
import FirebaseFirestore

struct Post{
    let postId: String
    var caption: String
    let imageUrl: String
    var likes: Int
    let ownerUid: String
    let timestamp: Timestamp
    
    init(postId: String, dictionary: [String: Any]) {
        self.postId = postId
        self.caption = dictionary["caption"] as? String ?? ""
        self.imageUrl = dictionary["imageUrl"] as? String ?? ""
        self.likes = dictionary["likes"] as? Int ?? 0
        self.ownerUid = dictionary["ownerUid"] as? String ?? ""
        self.timestamp = dictionary["ownerUid"] as? Timestamp ?? Timestamp(date: Date())
    }
}
