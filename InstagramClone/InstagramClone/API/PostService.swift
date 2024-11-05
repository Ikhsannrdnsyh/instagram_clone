//
//  PostService.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 05/11/24.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class PostService {
    static let shared = PostService()
    
    private init(){ }
    
    func postAnImage(caption: String, image: UIImage, user: User, completion: @escaping(FirestoreCompletion)){
        guard let uid = Auth.auth().currentUser?.uid else { return }
        
        ImageUploaderService.shared.uploadImage(image: image) { imageUrl in
            let data = ["caption": caption, "timestamp": Timestamp(date: Date()), "likes": 0, "imageUrl": imageUrl, "ownerUid": uid, "ownerUsername": user.username, "ownerProfileImage": user.profileImage] as [String: Any]

            FirebaseReference.getReference(.Post).addDocument(data: data, completion: completion)
        }
    }
    
    func fecthPosts(completion: @escaping([Post]) -> Void){
        FirebaseReference.getReference(.Post).order(by: "timestamp", descending: true).getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            
            let posts = documents.map({ Post(postId: $0.documentID, dictionary: $0.data()) })
            completion(posts)
        }
    }
    
    func fetchPosts(forUser uid: String, completion: @escaping([Post]) -> Void){
        let query = FirebaseReference.getReference(.Post).whereField("ownerUid", isEqualTo: uid)
        
        query.getDocuments { snapshot, error in
            guard let documents = snapshot?.documents else { return }
            
            var posts = documents.map({ Post(postId: $0.documentID, dictionary: $0.data()) })
            posts.sort(by: { $0.timestamp.seconds > $1.timestamp.seconds })
            
            completion(posts)
        }
    }
}
