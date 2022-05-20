//
//  RegisterViewController.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 05.05.2022.
//

import UIKit
import FirebaseAuth

class RegisterViewController: UIViewController {
	
	
	//MARK: UIElements
	
	//	let viewOne: UIView = {
	//		let UIview = UIView()
	//		UIview.contentMode = .scaleAspectFill
	//
	//		UIview.translatesAutoresizingMaskIntoConstraints = false
	//		return UIview
	//	}()
	//
	//	let viewTwo: UIView = {
	//		let UIview = UIView()
	//		UIview.contentMode = .scaleAspectFill
	//		UIview.translatesAutoresizingMaskIntoConstraints = false
	//		return UIview
	//	}()
	
	var emailTextfield: UITextField = {
		let field = UITextField()
		field.placeholder = "Your Email"
		field.keyboardType = .emailAddress
		//		field.background = UIImage(named: "textfield")
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
		field.placeholder = "Create Password"
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
	
	let registerButton: UIButton = {
		let button = UIButton()
		button.setTitle("Register", for: .normal)
		button.backgroundColor = UIColor.systemTeal
		button.layer.cornerRadius = 10
		button.addTarget(self, action: #selector(pushing), for: .touchUpInside)
		button.translatesAutoresizingMaskIntoConstraints = false
		return button
	}()
	
	
	//MARK: Lifecycle
	
	override func viewDidLoad() {
		super.viewDidLoad()
		//		setupUIViews()
		view.addSubviews([emailTextfield,passwordTextfield,registerButton])
		buildConstraints()
	}
	
	//	func setupUIViews() {
	//		viewOne.insertSubview(emailTextfield, at: 0)
	//		viewTwo.insertSubview(passwordTextfield, at: 0)
	//	}
	
	//	override func viewWillLayoutSubviews() {
	//		<#code#>
	//	}
	
	//MARK: Constraints
	
	func buildConstraints() {
		
		view.backgroundColor = .white
		
		NSLayoutConstraint.activate([
			
			emailTextfield.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			emailTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			emailTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
			emailTextfield.heightAnchor.constraint(equalToConstant: 50),
			
			passwordTextfield.topAnchor.constraint(equalTo: emailTextfield.bottomAnchor, constant: 15),
			passwordTextfield.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			passwordTextfield.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
			passwordTextfield.heightAnchor.constraint(equalToConstant: 50),
			
			registerButton.topAnchor.constraint(equalTo: passwordTextfield.bottomAnchor, constant: 25),
			registerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
			registerButton.heightAnchor.constraint(equalToConstant: 50)
			
			
			
		])
		
	}
	
	//MARK: Methods to Buttons
	
	@objc func pushing() {
		
		if let email = emailTextfield.text, let password = passwordTextfield.text {
			Auth.auth().createUser(withEmail: email, password: password) { authResult, error in
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
				}
			}
		}
		
	}
}
