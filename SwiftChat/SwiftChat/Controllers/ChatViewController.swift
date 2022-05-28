//
//  ChatViewController.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 05.05.2022.
//

import UIKit
import FirebaseAuth
import FirebaseFirestore

class ChatViewController: UIViewController {
    
//    struct Cells {
//        static let newCell = "newCell"
//    }
    
    //MARK: - Properties
    
    let db = Firestore.firestore()
    
    var messages: [Message] = []
//        Message(sender: "jeniffer91@hello.com", body: "Hey 👋"),
//        Message(sender: "jonh@yo.com", body: "Hello!"),
//        Message(sender: "jeniffer91@hello.com", body: "What's up")
//    ]
    
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
        loadMessages()
        
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
        
        // set row height
        tableView.rowHeight = 100
        
        //register cells
        // tableView.register(NewCell.self, forCellReuseIdentifier: K.cellIndentifier)
        tableView.register(UINib(nibName: K.nibName, bundle: nil), forCellReuseIdentifier: K.cellIndentifierXib)
        
        // set constraints
        // tableView.pin(to: view)
        
        // delegates and Data
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
    
    //method to load data from Data Base FireStore
    
    func loadMessages() {
         
        db.collection(K.FStore.collectionName).order(by: K.FStore.dateField).addSnapshotListener { querySnapshot, error in
            self.messages = []
            if let e = error {
                print ("There was an issue retriving data from Firestore.\(e)")
            } else {
                if let snapshotDocuments = querySnapshot?.documents {
                    for doc in snapshotDocuments {
                        let data = doc.data()
                        if let messageSender = data[K.FStore.senderField] as? String, let messageBody = data[K.FStore.bodyField] as? String {
                            let newMessage = Message(sender: messageSender, body: messageBody)
                            self.messages.append(newMessage)
                            //ha - ha
                            DispatchQueue.main.async {
                                self.tableView.reloadData()
                            }
                        }
                    }
                }
            }
        }
        
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
        
        if let messageBody = messageTextField.text, let messageSender = Auth.auth().currentUser?.email {
            db.collection(K.FStore.collectionName).addDocument(data:[
                K.FStore.senderField: messageSender,
                K.FStore.bodyField: messageBody,
                K.FStore.dateField: Date().timeIntervalSince1970
            ]) { (error) in
                if let e = error {
                    print("This was an issue to saving data to firestore, \(e)")
                } else {
                    print ("Success save data")
                }
            }
            
        }
        
    }
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        //returning number of elements in Chat content array
        return messages.count
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        /* returning cells and content with cell configuration
        cell with all initializators in another file
        this method triggered by previous returning count to configure each row in tableView */
        let cell = tableView.dequeueReusableCell(withIdentifier: K.cellIndentifierXib, for: indexPath) as! MessageCell
        cell.selectionStyle = .none
        cell.label.text = messages[indexPath.row].body
        tableView.separatorStyle = .none
        return cell
        // ?? UITableViewCell()
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
