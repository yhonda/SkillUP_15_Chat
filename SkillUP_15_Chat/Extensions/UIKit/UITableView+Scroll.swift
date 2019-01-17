//
//  UITableView+Scroll.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import UIKit

extension UITableView {

    /// TableViewの下へスクロールする
    func scrollToBottom(animated: Bool = true) {
        let bottomOffset = CGPoint(x: 0, y: contentSize.height - frame.size.height)
        setContentOffset(bottomOffset, animated: animated)
    }
}
