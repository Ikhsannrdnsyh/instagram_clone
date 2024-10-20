//
//  LoginController.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 18/10/24.
//

import UIKit
import GoogleSignIn
import FirebaseCore
import FirebaseAuth

class LoginController: UIViewController{
    
    //MARK: Properties
    private var viewModel = LoginViewModel()
    
    private let iconImage: UIImageView = {
        let iv = UIImageView(image: UIImage(named: "ic_logo"))
        iv.contentMode = .scaleAspectFill
        
        return iv
    }()
    
    private let emailTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Email Address")
        tf.keyboardType = .emailAddress
        tf.addTarget(self, action: #selector(onTextChanged), for: .editingChanged)
        
        return tf
    }()
    
    private let passwordTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Password")
        tf.isSecureTextEntry = true
        tf.addTarget(self, action: #selector(onTextChanged), for: .editingChanged)
        
        return tf
    }()
    
    private let loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Log In", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue.withAlphaComponent(0.6)
        button.layer.cornerRadius = 10
        button.setHeight(40)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.isEnabled = false
        button.addTarget(self, action: #selector(onTapLogin), for: .touchUpInside)
        
        return button
    }()
    
    private let googleButton: GIDSignInButton = {
        let button = GIDSignInButton()
        button.backgroundColor = UIColor.systemBlue
        button.layer.cornerRadius = 10
        button.setHeight(40)
        button.addTarget(self, action: #selector(onTapLoginGoogle), for: .touchUpInside)
        
        return button
    }()
    
    private let dontHaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: "Don't have an Account?", secondPart: "Sign Up")
        button.addTarget(self, action: #selector(onTapRegister), for: .touchUpInside)
        
        return button
    }()
    
    private let leftLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.systemGray
        line.setDimensions(height: 0.5, width: 132)
        
        return line
    }()
    
    private let rightLine: UIView = {
        let line = UIView()
        line.backgroundColor = UIColor.systemGray
        line.setDimensions(height: 0.5, width: 132)
        
        return line
    }()
    
    private let orLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor.lightGray
        label.text = "or"
        
        return label
    }()
    
    private let appleButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Continue with Apple", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue
        button.layer.cornerRadius = 10
        button.setHeight(40)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.addTarget(self, action: #selector(onTapLoginApple), for: .touchUpInside)
        
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
        
        let divStack = UIStackView(arrangedSubviews: [leftLine, orLabel, rightLine])
        divStack.axis = .horizontal
        divStack.spacing = 8
        divStack.alignment = .center
        divStack.distribution = .equalCentering
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, loginButton, divStack, appleButton, googleButton])
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
    private func onTapLoginApple(){
        print("on Tap Login Apple")
    }
    
    @objc
    private func onTapLoginGoogle(){
        guard let clientID = FirebaseApp.app()?.options.clientID else { return }
        
        // Create Google Sign In configuration object.
        let config = GIDConfiguration(clientID: clientID)
        GIDSignIn.sharedInstance.configuration = config
        
        // Start the sign in flow!
        GIDSignIn.sharedInstance.signIn(withPresenting: self) { [unowned self] result, error in
            guard error == nil else {
                print("DEBUG: Error Google Sign In \(error?.localizedDescription)")
                return
            }
            
            guard let user = result?.user,
                  let idToken = user.idToken?.tokenString
            else {
                
                print("DEBUG: Error Google Sign In \(error?.localizedDescription)")
                return
            }
            
            let credential = GoogleAuthProvider.credential(withIDToken: idToken,
                                                           accessToken: user.accessToken.tokenString)
            
            // Login to Firebase Auth
            AuthService.shared.registerGoogleUser(withCredential: credential) { error in
                
            }
        }
    }
    
    @objc
    private func onTapRegister(){
        let controller = RegistrationController()
        navigationController?.pushViewController(controller, animated: true)
    }
    
    @objc
    private func onTextChanged(sender: UITextField){
        if sender == emailTextField{
            viewModel.email = sender.text
        } else {
            viewModel.password = sender.text
        }
        
        updateForm()
    }
}

extension LoginController: FormViewModel{
    func updateForm() {
        loginButton.backgroundColor = viewModel.buttonBackgroundColor
        loginButton.isEnabled = viewModel.isValidForm
    }
    
    
}
