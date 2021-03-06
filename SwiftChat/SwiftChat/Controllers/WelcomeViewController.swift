//
//  ViewController.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 05.05.2022.
//

import UIKit
import CLTypingLabel

class WelcomeViewController: UIViewController {
    
    //MARK: UIElements
    
    let welcomeLabel: CLTypingLabel = {
        let label = CLTypingLabel()
        label.text = K.appName
        label.textColor = UIColor(named: K.BrandColors.blue)
        label.font = .systemFont(ofSize: 40, weight: .heavy)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    let registerButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.register, for: .normal)
        button.setTitleColor(.init(named: K.BrandColors.blue), for: .normal)
        button.backgroundColor = UIColor(named: K.BrandColors.lightBlue)
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(pushRegister), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    let logInButton: UIButton = {
        let button = UIButton()
        button.setTitle(K.logIn, for: .normal)
        button.backgroundColor = UIColor.systemTeal
        button.layer.cornerRadius = 3
        button.addTarget(self, action: #selector(pushLogIn), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    
    //MARK: Lifecycle

    override func viewDidLoad() {
        super.viewDidLoad()
        view.addSubviews([welcomeLabel, registerButton, logInButton])
        buildConstraints()
    }
    
    //MARK: Constraints
    
    func buildConstraints() {
        
        view.backgroundColor = .white
        
        NSLayoutConstraint.activate([
     
            welcomeLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            welcomeLabel.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            
            registerButton.heightAnchor.constraint(equalToConstant: 50),
            registerButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            registerButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -150),
            
            logInButton.heightAnchor.constraint(equalToConstant: 50),
            logInButton.widthAnchor.constraint(equalTo: view.widthAnchor),
            logInButton.topAnchor.constraint(equalTo: view.bottomAnchor, constant: -100)
            
            ])
        
    }
    
    //MARK: Methods to Buttons
    
    @objc func dismissing() {
        dismiss(animated: true)
    }
    
    @objc func pushRegister() {
        let regVC = RegisterViewController()
        navigationController?.pushViewController(regVC, animated: true)
    }
    
//    @objc func pushRegister() {
//        let logInViewController = LoginViewController()
//        logInViewController.modalPresentationStyle = .fullScreen
//        self.present(logInViewController, animated: true, completion: nil)
//        print("button Log In pressed")
//    }
    
    @objc private func pushLogIn() {
        
        let logInVC = LoginViewController()
        navigationController?.pushViewController(logInVC, animated: true)
    }
    
    

}

