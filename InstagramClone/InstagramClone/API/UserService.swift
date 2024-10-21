//
//  UserService.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 21/10/24.
//

import FirebaseFirestore

class UserService{
    static let shared = UserService()
    
    private init(){ }
    
    func fetchUser(withUid uid: String, completion: @escaping (User) -> Void ){
        FirebaseReference.getReference(.User).document(uid).getDocument { snapshot, error in
            guard let data = snapshot?.data() else { return }
            
            let user = User(dictionary: data)
            completion(user)
            
        }
    }
    
}
