//
//  NewCell.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 21/5/22.
//

import Foundation
import UIKit

final class NewCell: UITableViewCell {
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        buildConstraints()
    }
    
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
    func newMethod() {
        
    }
    
    func buildConstraints() {
        
        let label: UILabel = {
            let label = UILabel()
            label.text = "Privet"
            label.textColor = .systemPurple
            label.textAlignment = .center
            label.translatesAutoresizingMaskIntoConstraints = false
            return label
        }()
        
        contentView.addSubview(label)
        
        NSLayoutConstraint.activate([
            
            label.topAnchor.constraint(equalTo: contentView.topAnchor),
            label.leadingAnchor.constraint(equalTo: contentView.leadingAnchor),
            label.trailingAnchor.constraint(equalTo: contentView.trailingAnchor),
            label.bottomAnchor.constraint(equalTo: contentView.bottomAnchor)

        ])
        
        
    }
}
