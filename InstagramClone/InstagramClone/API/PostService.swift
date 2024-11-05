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
            let data = ["caption": caption, "timestamp": Timestamp(date: Date()), "likes": 0, "imageUrl": imageUrl, "ownerUid": uid] as [String: Any]

            FirebaseReference.getReference(.Post).addDocument(data: data, completion: completion)
        }
    }
}
