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
    
    enum GlowEffect: Float {
           case small = 0.4, normal = 2, big = 15
       }

       func doGlowAnimation(withColor color: UIColor, withEffect effect: GlowEffect = .normal) {
           layer.masksToBounds = false
           layer.shadowColor = color.cgColor
           layer.shadowRadius = 0
           layer.shadowOpacity = 1
           layer.shadowOffset = .zero

           let glowAnimation = CABasicAnimation(keyPath: "shadowRadius")
           glowAnimation.fromValue = 0
           glowAnimation.toValue = effect.rawValue
           glowAnimation.beginTime = CACurrentMediaTime()+0.3
           glowAnimation.duration = CFTimeInterval(0.3)
           glowAnimation.fillMode = .removed
           glowAnimation.autoreverses = true
           glowAnimation.isRemovedOnCompletion = true
           layer.add(glowAnimation, forKey: "shadowGlowingAnimation")
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
