//
//  MessageDao.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import Foundation
import RealmSwift

final class MessageDao {

    static let dao = RealmDaoHelper<Message>()

    static func add(message: String) {

        let object = Message()
        object.messageID = MessageDao.dao.newId()!
        object.message = message
        object.sendDate = Date().now()
        MessageDao.dao.add(d: object)
    }

    static func findAll() -> [Message] {
        let objects =  MessageDao.dao.findAll()
        return objects.map { Message(value: $0) }
    }
}
