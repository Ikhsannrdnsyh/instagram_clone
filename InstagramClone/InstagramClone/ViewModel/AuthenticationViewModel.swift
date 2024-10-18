//
//  AuthenticationViewModel.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 18/10/24.
//

import UIKit

struct LoginViewModel{
    var email: String?
    var password: String?
    
    var isValidForm: Bool{
        return email?.isEmpty == false && password?.isEmpty == false
    }
    
    var buttonBackgroundColor: UIColor {
        return isValidForm ? UIColor.systemBlue : UIColor.systemBlue.withAlphaComponent(0.6)
    }
}

struct RegistrationViewModel{
    
}
