//
//  User.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 21/10/24.
//

import FirebaseAuth

struct User {
    let email: String
<<<<<<< HEAD
    var fullname: String
    var profileImage: String
    var username: String
=======
    let fullname: String
    let profileImage: String
    let username: String
>>>>>>> main
    let uid: String
    
    var stats: UserStats!
    
    var isFollowed = false
    
    var isCurrentUser: Bool {
        return Auth.auth().currentUser?.uid == uid
    }
    
    init(dictionary: [String : Any]) {
        self.email = dictionary["email"] as? String ?? ""
        self.fullname = dictionary["fullname"] as? String ?? ""
        self.profileImage = dictionary["profileImage"] as? String ?? ""
        self.username = dictionary["username"] as? String ?? ""
        self.uid = dictionary["uid"] as? String ?? ""
        
        self.stats = UserStats(followers: 0, following: 0, posts: 0)
    }
}

struct UserStats{
    let followers: Int
    let following: Int
    let posts: Int
}
