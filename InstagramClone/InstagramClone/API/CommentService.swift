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
        let data : [String: Any] = ["uid": user.uid, "comment": comment, "username": user.username, "profileImage": user.profileImage, "postOwnerId": post.ownerUid, "timestamp": Timestamp(date: Date())]
        
        FirebaseReference.getReference(.Post).document(post.postId).collection("Comments").addDocument(data: data, completion: completion)
    }
    
    func fetchComments(forPost postId: String, completion: @escaping([Comment]) -> Void) {
        var comments = [Comment]()
        let query = FirebaseReference.getReference(.Post).document(postId).collection("Comments").order(by: "timestamp", descending: true)
        
        query.addSnapshotListener { snapshot, error in
            snapshot?.documentChanges.forEach({ change in
                if change.type == .added {
                    let data = change.document.data()
                    let comment = Comment(dictionary: data)
                    comments.append(comment)
                }
            })
            
            completion(comments)
        }
    }
}
