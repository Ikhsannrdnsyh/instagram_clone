//
//  RegistrationController.swift
//  InstagramClone
//
//  Created by Mochamad Ikhsan Nurdiansyah on 18/10/24.
//

import UIKit

class RegistrationController: UIViewController{
    //MARK: Properties
    private var viewModel = RegistrationViewModel()
    private var profileImage: UIImage?
    
    private let photoButton: UIButton = {
        let button = UIButton(type: .system)
        button.setImage(UIImage(systemName: "plus.circle.fill"), for: .normal)
        button.addTarget(self, action: #selector(onTapPhoto), for: .touchUpInside)
        
        return button
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
    
    private let fullnameTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Fullname")
        tf.keyboardType = .default
        tf.addTarget(self, action: #selector(onTextChanged), for: .editingChanged)
        
        return tf
    }()
    
    private let usernameTextField: UITextField = {
        let tf = CustomTextField(placeholder: "Username")
        tf.keyboardType = .default
        tf.addTarget(self, action: #selector(onTextChanged), for: .editingChanged)
        
        return tf
    }()
    
    private let signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.white, for: .normal)
        button.backgroundColor = .systemBlue.withAlphaComponent(0.8)
        button.layer.cornerRadius = 10
        button.setHeight(40)
        button.titleLabel?.font = UIFont.boldSystemFont(ofSize: 12)
        button.isEnabled = true
        button.addTarget(self, action: #selector(onTapSignUp), for: .touchUpInside)
        
        return button
    }()
    
    private let HaveAccountButton: UIButton = {
        let button = UIButton(type: .system)
        button.attributedTitle(firstPart: " Already have an Account?", secondPart: "Sign In")
        button.addTarget(self, action: #selector(onTapSignIn), for: .touchUpInside)
        
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
        
        view.addSubview(photoButton)
        photoButton.centerX(inView: view)
        photoButton.setDimensions(height: 98, width: 98)
        photoButton.anchor(top: view.safeAreaLayoutGuide.topAnchor, paddingTop: 32)
        
        let stack = UIStackView(arrangedSubviews: [emailTextField, passwordTextField, fullnameTextField, usernameTextField, signUpButton])
        stack.axis = .vertical
        stack.spacing = 20
        
        view.addSubview(stack)
        stack.anchor(top: photoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor, paddingTop: 64, paddingLeft: 16, paddingRight: 16)
        
        view.addSubview(HaveAccountButton)
        HaveAccountButton.centerX(inView: view)
        HaveAccountButton.anchor(bottom: view.safeAreaLayoutGuide.bottomAnchor)
        
    }
    
    //MARK: Actions
    @objc
    private func onTapPhoto(){
        let picker = UIImagePickerController()
        picker.delegate = self
        picker.allowsEditing = true
        
        present(picker, animated: true, completion: nil)
    }
    
    @objc
    private func onTapSignUp(){
        print("on Tap Login")
    }
    
    @objc
    private func onTapSignIn(){
        navigationController?.popViewController(animated: true)
    }
    
    @objc
    private func onTextChanged(sender: UITextField){
        if sender == emailTextField{
            viewModel.email = sender.text
        } else if sender == passwordTextField {
            viewModel.password = sender.text
        }else if sender == fullnameTextField {
            viewModel.fullName = sender.text
        }else if sender == usernameTextField {
            viewModel.username = sender.text
        }
        updateForm()
        
        
    }
}

//MARK: FormViewModel
extension RegistrationController: FormViewModel{
    func updateForm() {
        signUpButton.backgroundColor = viewModel.buttonBackgroundColor
        signUpButton.isEnabled = viewModel.isValidForm
    }
}

//MARK: UIImagePickerControllerDelegate
extension RegistrationController: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let image = info[.editedImage] as? UIImage else { return }
        profileImage = image
        
        photoButton.contentMode = .scaleAspectFit
        photoButton.clipsToBounds = true
        photoButton.layer.cornerRadius = photoButton.frame.width / 2
        photoButton.layer.masksToBounds = true
        photoButton.layer.borderColor = UIColor.systemBlue.withAlphaComponent(0.5).cgColor
        photoButton.layer.borderWidth = 2
        photoButton.setImage(image.withRenderingMode(.alwaysOriginal), for: .normal)
        
        self.dismiss(animated: true, completion: nil)
    }
}
