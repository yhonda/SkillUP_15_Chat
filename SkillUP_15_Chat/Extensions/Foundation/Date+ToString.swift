//
//  Date+ToString.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import Foundation

extension Date {

    /// Date型をString型に変更する
    func toStr(dateFormat: String) -> String  {

        let dateFormatter = DateFormatter()
        dateFormatter.locale = NSLocale(localeIdentifier: "ja_JP") as Locale!
        dateFormatter.timeStyle = .short
        dateFormatter.dateStyle = .short
        dateFormatter.dateFormat = dateFormat

        return dateFormatter.string(from: self)
    }
}
