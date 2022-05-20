//
//  LoginViewController.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 05.05.2022.
//

import UIKit
import FirebaseAuth

class LoginViewController: UIViewController {
	
	//MARK: UIElements
	
	let backgroundView: UIView = {
		let view = UIView()
		view.backgroundColor = .cyan
		view.translatesAutoresizingMaskIntoConstraints = false
		return view
	}()
	
	var emailTextfield: UITextField = {
		let field = UITextField()
		field.placeholder = "Email"
		field.keyboardType = .emailAddress
		field.textAlignment = .center
		field.layer.borderWidth = 0.5
		field.layer.borderColor = UIColor(named: "BrandBlue")?.cgColor
		field.layer.shadowColor = UIColor.black.cgColor
		field.layer.shadowOffset = .zero
		field.layer.shadowRadius = 3
		field.layer.shadowOpacity = 0.5
		field.layer.cornerRadius = 10
		field.translatesAutoresizingMaskIntoConstraints = false
		return field
	}()
	
	var passwordTextfield: UITextField = {
		let field = UITextField()
		field.placeholder = "Password"
		field.textContentType = .newPassword
		field.isSecureTextEntry = true
		field.layer.borderWidth = 0.5
		field.layer.borderColor = UIColor(named: "BrandBlue")?.cgColor
		field.layer.shadowColor = UIColor.black.cgColor
		field.layer.shadowOffset = .zero
		field.layer.shadowRadius = 3
		field.layer.shadowOpacity = 0.5
		field.layer.cornerRadius = 10
		field.textAlignment = .center
		field.translatesAutoresizingMaskIntoConstraints = false
		return field
	}()
	
	let logInButton: UIButton = {
		let button = UIButton()
		button.setTitle("Log In", for: .normal)
		button.backgroundColor = UIColor.systemTeal
		button.layer.cornerRadius = 10
		button.addTarget(self, action: #selector(pushLogIn), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	
	//MARK: Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		view.addSubviews([backgroundView,emailTextfield,passwordTextfield,logInButton])
		buildConstraints()
		
	}
	
	//MARK: Constraints
	
	func buildConstraints() {
		
		
		NSLayoutConstraint.activate([
			
			backgroundView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
			backgroundView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
			backgroundView.topAnchor.constraint(equalTo: view.topAnchor),
			backgroundView.bottomAnchor.constraint(equalTo: view.bottomAnchor),
			
			emailTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			emailTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			emailTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
			emailTextfield.heightAnchor.constraint(equalToConstant: 50),
			
			passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 15),
			passwordTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			passwordTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
			passwordTextfield.heightAnchor.constraint(equalToConstant: 50),
			
			logInButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 25),
			logInButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			logInButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
			logInButton.heightAnchor.constraint(equalToConstant: 50)
			
			
			
		])
		
	}
	
	//MARK: Methods to Buttons
	
	@objc func pushing() {
		self.dismiss(animated: true, completion: nil)
		print("Hello")
	}
	
	@objc func pushLogIn() {
		
		if let email = emailTextfield.text, let password = passwordTextfield.text {
			Auth.auth().signIn(withEmail: email, password: password) { authResult, error in
				//				guard let strongSelf = self else { return }
				if let err = error {
					DispatchQueue.main.async {
						let alert = UIAlertController(title: "Error", message: "KYKY\(err.localizedDescription)" , preferredStyle: .alert)
						alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
						alert.addAction(UIAlertAction(title: "No", style: .cancel, handler: nil))
						self.present(alert, animated: false)
					}
				} else {
					let chatViewController = ChatViewController()
					chatViewController.modalPresentationStyle = .fullScreen
					self.present(chatViewController, animated: true, completion: nil)
					print("button LogIn  pressed")
				}
			}
		}
	}
	
}
