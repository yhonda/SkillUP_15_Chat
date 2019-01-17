//
//  UIViewController+Notification.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import UIKit

extension UIViewController {

    /// Notificationの登録
    func addNotificationObserver(name: Notification.Name, selector: Selector) {
        NotificationCenter.default.addObserver(self,
                                               selector: selector,
                                               name: name,
                                               object: nil)
    }

    /// Notificationの解除
    func removeNotificationObserver(name: Notification.Name) {
        NotificationCenter.default.removeObserver(self,
                                                  name: name,
                                                  object: nil)
    }

    /// 全Notificationの解除
    func removeNotificationsObserver() {
        NotificationCenter.default.removeObserver(self)
    }
}
