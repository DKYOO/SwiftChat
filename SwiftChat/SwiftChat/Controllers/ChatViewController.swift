//
//  ChatViewController.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 05.05.2022.
//

import UIKit

class ChatViewController: UIViewController {
    
    struct Cells {
        static let newCell = "newCell"
    }
    
    //MARK: UIElements
    
    private var tableView = UITableView()
    private let cellsArray: Array =  ["HipHop", "Don't", "Stop"]
    
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
        view.backgroundColor = .purple
        title = "Hello"
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
        tableView.rowHeight = 200
        
        //register cells
//        tableView.register(newCell.self, forCellReuseIdentifier: <#T##String#>)
        
        
        //set constraints
        tableView.pin(to: view)
        
        //delegates and Data
        tableView.delegate = self
        tableView.dataSource = self
        
    }
    
    
}

extension ChatViewController: UITableViewDelegate, UITableViewDataSource {
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
//        let cell = tableView.dequeueReusableCell(withIdentifier: newCell)
        return UITableViewCell()
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
