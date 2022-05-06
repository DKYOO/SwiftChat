//
//  RegisterViewController.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 05.05.2022.
//

import UIKit

class RegisterViewController: UIViewController {
	
	
	//MARK: UIElements
	
	let viewOne: UIView = {
		let UIview = UIView()
		UIview.contentMode = .scaleAspectFill

		UIview.translatesAutoresizingMaskIntoConstraints = false
		return UIview
	}()
	
	let viewTwo: UIView = {
		let UIview = UIView()
		UIview.contentMode = .scaleAspectFill
		UIview.translatesAutoresizingMaskIntoConstraints = false
		return UIview
	}()
	
	var emailTextfield: UITextField = {
		let field = UITextField()
		field.placeholder = "Your Email"
		field.keyboardType = .emailAddress
		field.background = UIImage(named: "textfield")
		field.textAlignment = .center
		field.backgroundColor = .green
		field.layer.cornerRadius = 3
		field.translatesAutoresizingMaskIntoConstraints = false
		return field
	}()
	
	var passwordTextfield: UITextField = {
		let field = UITextField()
		field.placeholder = "Enter Password"
		field.textContentType = .newPassword
		field.isSecureTextEntry = true
		field.background = UIImage(named: "textfield")
		field.textAlignment = .center
		field.backgroundColor = .red
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
		setupUIViews()
		view.addSubviews([viewOne,viewTwo,registerButton])
		buildConstraints()
	}
	
	func setupUIViews() {
		viewOne.insertSubview(emailTextfield, at: 0)
		viewTwo.insertSubview(passwordTextfield, at: 0)
	}
	
	//MARK: Constraints
	
	func buildConstraints() {
		
		view.backgroundColor = .white
		
		NSLayoutConstraint.activate([
			
			viewOne.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 30),
			viewOne.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			viewOne.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
			viewOne.heightAnchor.constraint(equalToConstant: 50),
			
			viewTwo.topAnchor.constraint(equalTo: viewOne.bottomAnchor, constant: 15),
			viewTwo.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			viewTwo.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
			viewTwo.heightAnchor.constraint(equalToConstant: 50),
			
			registerButton.topAnchor.constraint(equalTo: viewTwo.bottomAnchor, constant: 25),
			registerButton.leftAnchor.constraint(equalTo: view.leftAnchor, constant: 24),
			registerButton.rightAnchor.constraint(equalTo: view.rightAnchor, constant: -24),
			registerButton.heightAnchor.constraint(equalToConstant: 50)
			
			
			
		])
		
	}
	
	//MARK: Methods to Buttons
	
	@objc func pushing() {
		self.dismiss(animated: true, completion: nil)
		print("Hello Epta")
	}
	
}
