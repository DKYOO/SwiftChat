//
//  ChatViewController.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 05.05.2022.
//

import UIKit
import FirebaseAuth

class ChatViewController: UIViewController {
    
    struct Cells {
        static let newCell = "newCell"
    }
    
    //MARK: UIElements
    
    private var tableView = UITableView()
    
    let backgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .purple
        return view
    }()
    
    let bottomBar: UIView = {
        //WTF ?)))
        let view = UIView()
        view.backgroundColor = .systemPurple
        return view
    }()
    
    //MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "🏎 SwiftChat"
        //hide Back Button
        navigationItem.hidesBackButton = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "Log Out", style: .plain, target: self, action: #selector(signOut))
        view.backgroundColor = .purple
        title = "Welcome to Chat"
        
        view.addSubviews([backgroundView, tableView, bottomBar])
        buildConstraints()
        configureTableView()
        
    }
    
    
    //MARK: Constraints
    
    func buildConstraints() {
        backgroundView.pin(to: view)
        
        NSLayoutConstraint.activate([
            
            
            
        ])
    }
    
    
    //MARK: Methods
    
    
    func configureTableView() {
        
        //set row height
        tableView.rowHeight = 100
        //register cells
        tableView.register(NewCell.self, forCellReuseIdentifier: "new")
        
        //set constraints
        tableView.pin(to: view)
        
        //delegates and Data
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    @objc private func signOut() {
        
        let firebaseAuth = Auth.auth()
        do {
            try firebaseAuth.signOut()
            //go to the WelcomeViewController
            navigationController?.popToRootViewController(animated: true)
        } catch let signOutError as NSError {
            print("Error signing out: %@", signOutError)
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
        let cell = tableView.dequeueReusableCell(withIdentifier: "new")
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
