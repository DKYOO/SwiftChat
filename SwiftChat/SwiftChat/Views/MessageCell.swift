//
//  MessageCell.swift
//  SwiftChat
//
//  Created by Dmitry Kaveshnikov on 25/5/22.
//

import UIKit

class MessageCell: UITableViewCell {

    
    @IBOutlet weak var MessageBubble: UIView!
    
    @IBOutlet weak var Label: UILabel!
    
    @IBOutlet weak var rightImageView: UIImageView!
    
    @IBOutlet weak var leftImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        MessageBubble.layer.cornerRadius = MessageBubble.frame.size.height / 5
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
