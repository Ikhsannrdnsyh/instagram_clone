//
//  AuthService.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 20/10/24.
//

import UIKit

struct AuthCredential{
    let email: String
    let password: String
    let fullname: String
    let username: String
    let profileImage: UIImage
}

class AuthService{
    static let shared = AuthService()
    
    private init(){ }
    
    func registerUser(withCredential credential: AuthCredential){
        print("credential: \(credential)")
    }
}
