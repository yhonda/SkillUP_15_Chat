//
//  MessageListProvider.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import UIKit

class MessageListProvider: NSObject {

    fileprivate var sections = [String]()
    fileprivate var messages = [[Message]]()

    func set(messages: [Message]) {

        guard !messages.isEmpty else {
            return
        }

        self.sections.removeAll()
        self.messages.removeAll()

        let calender = Calendar(identifier: .gregorian)
        var sectionCount = 0
        var date = messages.first?.sendDate

        self.sections.append((date?.toStr(dateFormat: "yyyy-MM-dd"))!)

        for message in messages {

            if !calender.isDate(date!, inSameDayAs: message.sendDate!) {
                self.sections.append((message.sendDate?.toStr(dateFormat: "yyyy-MM-dd"))!)
                date = message.sendDate!
                sectionCount += 1
            }

            self.messages.append([Message]())
            self.messages[sectionCount].append(message)
        }
    }

    func message(indexPath: IndexPath) -> Message {
        guard indexPath.section < self.sections.count else {
            fatalError("Sectionの要素数を超えました。")
        }
        guard indexPath.row < self.messages[indexPath.section].count else {
            fatalError("Cellの要素数を超えました。")
        }
        return self.messages[indexPath.section][indexPath.row]
    }
}

extension MessageListProvider: UITableViewDataSource {

    func numberOfSections(in tableView: UITableView) -> Int {
        return self.sections.count
    }

    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        let sectionName = self.sections[section]
        return sectionName
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.messages[section].count
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        guard let cell = tableView.dequeueReusableCell(withIdentifier: MessageCell.identifier,
                                                       for: indexPath) as? MessageCell
            else {
                fatalError("MessageCellが取得できない")
        }

        cell.message = message(indexPath: indexPath)
        return cell
    }
}
