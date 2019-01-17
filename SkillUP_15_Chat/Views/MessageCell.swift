//
//  MessageCell.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import Foundation
import UIKit

class MessageCell: UITableViewCell {

    @IBOutlet weak var messageLabel: UILabel!
    @IBOutlet weak var timeLabel: UILabel!

    static var identifier: String {
        return String(describing: self)
    }

    var message: Message? {

        didSet {
            messageLabel.text = message?.message
            timeLabel.text = message?.sendDate?.toStr(dateFormat: "hh:mm")
        }
    }

}
