//
//  CommentService.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 11/11/24.
//

import FirebaseFirestore

class CommentService {
    static let shared = CommentService()
    
    private init(){ }
    
    func uploadComment(comment: String, post: Post, user: User, completion: @escaping(FirestoreCompletion)) {
        let data : [String: Any] = ["uid": user.uid, "comment": comment, "username": user.username, "profileImageUrl": user.profileImage, "postOwnerId": post.ownerUid, "timestamp": Timestamp(date: Date())]
        
        FirebaseReference.getReference(.Post).document(post.postId).collection("Comments").addDocument(data: data, completion: completion)
    }
}
