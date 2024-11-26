//
//  UserCellViewModel.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 21/10/24.
//

import Foundation


struct UserCellViewModel {
    private let user: User
    
    var profileImageUrl: URL? {
        return URL(string: user.profileImage)
    }
    
    var fullname: String{
        return user.fullname
    }
    
    var username: String{
        return user.username
    }
    
    init(user: User) {
        self.user = user
    }
}
