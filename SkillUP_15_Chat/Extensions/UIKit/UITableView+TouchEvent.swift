//
//  UITableView+TouchEvent.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import UIKit

extension UITableView {

    /// TableViewのTouchEvent
    override open func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.next?.touchesBegan(touches, with: event)
    }
}
