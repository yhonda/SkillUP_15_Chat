//
//  Message.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import Foundation
import RealmSwift

class Message: Object {

    @objc
    dynamic var messageID = 0
    @objc
    dynamic var message = ""
    @objc
    dynamic var sendDate: Date?

    override static func primaryKey() -> String? {
        return "messageID"
    }
}
