//
//  RegistrationController.swift
//  TwitterTutorial
//
//  Created by Алик on 15.03.2021.
//


import UIKit
import Firebase

class RegistrationController: UIViewController {
    
    //MARK: - Properties
    private let imagePicker = UIImagePickerController()
    private var profileImage: UIImage?
    
    private let plusPtohoButton: UIButton = {
        let button = UIButton(type: .system)
        let image = #imageLiteral(resourceName: "plus_photo")
        button.setImage(image, for: .normal)
        button.tintColor = .white
        button.addTarget(self, action: #selector(plusPtohoButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private lazy var emailContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_mail_outline_white_2x-1")
        let view = Utilities().inputContainer(withImage: image, textField: emailTextField)
        return view
    }()
    
    private lazy var passwordContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_lock_outline_white_2x")
        let view = Utilities().inputContainer(withImage: image, textField: passwordTextField)
        return view
    }()
    
    private lazy var fullNameContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainer(withImage: image, textField: fullNameTextField)
        return view
    }()
    
    private lazy var userNameContainerView: UIView = {
        let image = #imageLiteral(resourceName: "ic_person_outline_white_2x")
        let view = Utilities().inputContainer(withImage: image, textField: userNameTextField)
        return view
    }()
    
    private let emailTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Email")
        return textField
    }()
    
    private let passwordTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Password")
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private let fullNameTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "Full Name")
        return textField
    }()
    
    private let userNameTextField: UITextField = {
        let textField = Utilities().textField(withPlaceholder: "User Name")
        return textField
    }()
    
    private let registrationButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitle("Sign Up", for: .normal)
        button.setTitleColor(.twitterBlue, for: .normal)
        button.backgroundColor = .white
        button.heightAnchor.constraint(equalToConstant: 50).isActive = true
        button.layer.cornerRadius = 5
        button.titleLabel?.font = .boldSystemFont(ofSize: 20)
        button.addTarget(self, action: #selector(registrationButtonTapped), for: .touchUpInside)
        return button
    }()
    
    private let alreadyHaveAccountButton: UIButton = {
        let button = Utilities().attributedButton("Already have an account?", " Log In")
        button.addTarget(self, action: #selector(alreadyHaveAccountButtonTapped), for: .touchUpInside)
        return button
    }()
    
    //MARK: - Lifecycle
    deinit { print("* RegistrationController - deinit") }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        configureUI()
    }
    
    //MARK: - Selectors
    @objc func plusPtohoButtonTapped() {
        present(imagePicker, animated: true, completion: nil)
    }
    
    @objc func registrationButtonTapped() {
        guard let profileImage = profileImage else {
            print("* DEBUG: Please select a profile image...")
            return
        }
        guard let email = emailTextField.text else { return }
        guard let password = passwordTextField.text else { return }
        guard let fullName = fullNameTextField.text else { return }
        guard let userName = userNameTextField.text else { return }
        
        let credentials = AuthCredentials(email: email,
                                          password: password,
                                          fullName: fullName,
                                          userName: userName,
                                          profileImage: profileImage)
        
        AuthService.shared.registerUser(credentials: credentials) { (error, reference) in
            print(#function)
        }
    }
    
    @objc func alreadyHaveAccountButtonTapped() {
        navigationController?.popViewController(animated: true)
    }
    
    //MARK: - Helpers
    func configureUI() {
        view.backgroundColor = .twitterBlue
        
        imagePicker.delegate = self
        imagePicker.allowsEditing = true
        
        view.addSubview(plusPtohoButton)
        plusPtohoButton.centerX(inView: view, topAnchor: view.safeAreaLayoutGuide.topAnchor)
        plusPtohoButton.setDimensions(width: 128, height: 128)
        
        let stack = UIStackView(arrangedSubviews: [
            emailContainerView, passwordContainerView, fullNameContainerView, userNameContainerView, registrationButton
        ])
        stack.axis = .vertical
        stack.spacing = 20
        stack.distribution = .fillEqually
        
        view.addSubview(stack)
        stack.anchor(top: plusPtohoButton.bottomAnchor, left: view.leftAnchor, right: view.rightAnchor,
                     paddingTop: 32, paddingLeft: 32, paddingRight: 32)
        
        view.addSubview(alreadyHaveAccountButton)
        alreadyHaveAccountButton.anchor(left: view.leftAnchor, bottom: view.safeAreaLayoutGuide.bottomAnchor, right: view.rightAnchor, paddingLeft: 40, paddingRight: 16)
    }
}

//MARK: - UINavigationControllerDelegate
extension RegistrationController: UINavigationControllerDelegate {}

//MARK: - UIImagePickerControllerDelegate
extension RegistrationController: UIImagePickerControllerDelegate {
    
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
        guard let profileImage = info[.editedImage] as? UIImage else { return }
        self.profileImage = profileImage
        
        plusPtohoButton.layer.cornerRadius = 128 / 2
        plusPtohoButton.layer.masksToBounds = true
        plusPtohoButton.imageView?.contentMode = .scaleAspectFill
        plusPtohoButton.imageView?.clipsToBounds = true
        plusPtohoButton.layer.borderColor = UIColor.white.cgColor
        plusPtohoButton.layer.borderWidth = 3
        
        self.plusPtohoButton.setImage(profileImage.withRenderingMode(.alwaysOriginal), for: .normal)
        
        dismiss(animated: true, completion: nil)
    }
}
