//
//  ChatViewController.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 05.05.2022.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
//    struct Cells {
//        static let newCell = "newCell"
//    }
    
    //MARK: UIElements
    
    private var tableView: UITableView = {
        let tableView = UITableView()
        tableView.translatesAutoresizingMaskIntoConstraints = false
        return tableView
    }()
    
    let bottomBar: UIView = {
        let view = UIView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let messageTextField: UITextField = {
        let text = UITextField()
        text.font = .systemFont(ofSize: 20, weight: .bold)
        text.placeholder = "Write your Message here"
        text.textColor = .systemGreen
        text.layer.cornerRadius = 7
        text.textAlignment = .left
        text.backgroundColor = .white
        text.translatesAutoresizingMaskIntoConstraints = false
        return text
        
    }()
    
    let sendButton: UIButton = {
        let button = UIButton(type: .system)
        let config = UIImage.SymbolConfiguration(pointSize: 50, weight: .regular, scale: .large)
        let trashImage = UIImage(systemName: "trash.circle", withConfiguration: config)
        button.setImage(trashImage, for: .normal)
        button.addTarget(self, action: #selector(sendMessage), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button

    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = K.appName
        //hide Back Button
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: K.logOut, style: .plain, target: self, action: #selector(signOut))
        view.backgroundColor = .purple
        title = "Welcome to Chat"
        view.addSubviews([tableView, bottomBar])
        buildConstraints()
        configureTableView()
        
    }
    
    
    //MARK: Constraints
    
    func buildConstraints() {
        
        view.backgroundColor = .systemPurple
        self.configureBottomBar()
        
        NSLayoutConstraint.activate([
            
            tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            tableView.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            tableView.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            tableView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -100),
            
            bottomBar.topAnchor.constraint(equalTo: tableView.bottomAnchor),
            bottomBar.leftAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leftAnchor),
            bottomBar.rightAnchor.constraint(equalTo: view.safeAreaLayoutGuide.rightAnchor),
            bottomBar.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            
            
            
        ])
    }
    
    
    //MARK: Methods
    
    
    func configureTableView() {
        
        //set row height
        tableView.rowHeight = 100
        //register cells
        tableView.register(NewCell.self, forCellReuseIdentifier: K.cellIndentifier)
        
        //set constraints
        //        tableView.pin(to: view)
        
        //delegates and Data
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    func configureBottomBar() {
        bottomBar.addSubviews([messageTextField, sendButton])
        
        bottomBar.backgroundColor = .purple
        
        NSLayoutConstraint.activate([
            messageTextField.topAnchor.constraint(equalTo: bottomBar.topAnchor, constant: 20),
            messageTextField.leftAnchor.constraint(equalTo: bottomBar.leftAnchor, constant: 20),
            messageTextField.heightAnchor.constraint(equalToConstant: 50),
            messageTextField.widthAnchor.constraint(equalTo: view.safeAreaLayoutGuide.widthAnchor, constant: -100),
            
            sendButton.topAnchor.constraint(equalTo: messageTextField.topAnchor),
            sendButton.leftAnchor.constraint(equalTo: messageTextField.rightAnchor, constant: 14),
            sendButton.heightAnchor.constraint(equalToConstant: 50),
            sendButton.widthAnchor.constraint(equalToConstant: 50)
            
            ])
        
    }
    
    @objc private func signOut() {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            //go to the WelcomeViewController
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print(K.Errors.signOutError, signOutError)
        }
        
    }
    
    @objc private func sendMessage() {
        
    }
    
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIndentifier)
        cell?.selectionStyle = .none
        return cell ?? UITableViewCell()
    }
    
    
    
}


//import UIKit
//class ViewController: UIViewController {
//  let tableView = UITableView()
//  var safeArea: UILayoutGuide!
//  override func loadView() {
//    super.loadView()
//    view.backgroundColor = .white
//    safeArea = view.layoutMarginsGuide
//    setupTableView()
//  }
//  func setupTableView() {
//    view.addSubview(tableView)
//  tableView.translatesAutoresizingMaskIntoConstraints = false
//  tableView.topAnchor.constraint(equalTo: safeArea.topAnchor).isActive = true
//  tableView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
//  tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
//  tableView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
//  }
//}
