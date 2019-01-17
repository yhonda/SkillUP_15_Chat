//
//  Date+Now.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import Foundation

extension Date {

    /// 今日の日付を取得
    func now() -> Date {
        let formatter = DateFormatter()
        formatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        formatter.timeStyle = .short
        formatter.dateStyle = .short
        formatter.dateFormat = "yyyy/MM/dd HH:mm:ss"
        return formatter.date(from: formatter.string(from:self))!
    }
}
