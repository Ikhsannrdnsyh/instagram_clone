//
//  LoginController.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 18/10/24.
//

import UIKit

class LoginController: UIViewController{

    //MARK: Properties
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "ic_logo"))
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email Address")
        tf.keyboardType = .emailAddress
        
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        button.layer.cornerRadius = 10
        button.setHeight(40)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.isEnabled = true
        button.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Don't have an Account?", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(onTapRegister), for: .touchUpInside)
        
        return button
    }()
    
    //MARK: Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    
    //MARK: Config UI
    private func configureUI(){
        view.backgroundColor = .white
        
        if let navigationController = navigationController {
            navigationController.navigationBar.isHidden = true
            navigationController.navigationBar.barStyle = .black
        }

        
        view.addSubview(iconImage)
        iconImage.centerX(inView: view)
        iconImage.setDimensions(height: 30, width: 100)
        iconImage.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 40)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: iconImage.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 64, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(dontHaveAccountButton)
        dontHaveAccountButton.centerX(inView: view)
        dontHaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
    }
    
    //MARK: Actions
    @objc
    private func onTapLogin(){
        print("on Tap Login")
    }
    
    @objc
    private func onTapRegister(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }

}
