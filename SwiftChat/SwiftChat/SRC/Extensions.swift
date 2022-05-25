//
//  Extensions.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 05.05.2022.
//

import Foundation
import UIKit

extension UIView {
    func addSubviews(_ views: [Any]) {
        views.forEach { if let view = $0 as? UIView {
            self.addSubview(view)
            }
        }
    }
    
    func pin(to superView: UIView) {
        translatesAutoresizingMaskIntoConstraints = false
        topAnchor.constraint(equalTo: superView.topAnchor).isActive = true
        leadingAnchor.constraint(equalTo: superView.leadingAnchor).isActive = true
        trailingAnchor.constraint(equalTo: superView.trailingAnchor).isActive = true
        bottomAnchor.constraint(equalTo: superView.bottomAnchor).isActive = true
    }
}

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        tap.cancelsTouchesInView = false
        view.addGestureRecognizer(tap)
    }

    @objc func dismissKeyboard() {
        view.endEditing(true)
    }
    
    //super extension Check IT!!!
//    func setupNavigationController(rootVC: UIViewController, action: Selector?, title: String, style: UIBarButtonItem.Style) {
//        rootVC.title = "Hello Controller"
//        rootVC.navigationItem.leftBarButtonItem = UIBarButtonItem(title: title, style: style, target: self, action: action)
//    }
}
