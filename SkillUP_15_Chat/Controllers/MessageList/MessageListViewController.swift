//
//  MessageListViewController.swift
//  SkillUP_15_Chat
//
//  Created by yuutaro honda on 2018/02/17.
//  Copyright © 2018年 y.honda. All rights reserved.
//

import UIKit

class MessageListViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var textView: UITextView!
    @IBOutlet weak var inputViewBottom: NSLayoutConstraint!
    @IBOutlet weak var textViewHeight: NSLayoutConstraint!
    @IBOutlet weak var sendButton: UIButton!

    fileprivate let dataSource = MessageListProvider()

    override func viewDidLoad() {
        super.viewDidLoad()
        setup()
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        reloadMessageList()
    }

    deinit {
        removeNotificationsObserver()
    }
}

// MARK: - private
private extension MessageListViewController {

    /// 初期設定
    func setup() {

        setTableView()
        setTextView()
        setNotification()
        sendButton.isEnabled = false
    }

    // TableViewの設定
    func setTableView() {
        tableView.dataSource = dataSource
        tableView.delegate = self
        tableView.estimatedRowHeight = 66
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    // TextViewの設定
    func setTextView() {
        textView.delegate = self
    }

    // Notificationの設定
    func setNotification() {

        addNotificationObserver(name: .UIKeyboardWillShow,
                                selector: #selector(keyboardWillShow(notification:)))
        addNotificationObserver(name: .UIKeyboardWillHide,
                                selector: #selector(keyboardWillHide))
        addNotificationObserver(name: .UIKeyboardWillChangeFrame,
                                selector: #selector(keyboardWillChangeFrame(notification:)))
    }

    // dataSourceの設定
    func reloadMessageList() {
        dataSource.set(messages: MessageDao.findAll())
        tableView.reloadData()
        tableView.scrollToBottom()
    }

    // TextViewの位置調整
    func changeTextViewBottom(notification: Notification) {
        guard let rect = notification.userInfo?[UIKeyboardFrameEndUserInfoKey] as? CGRect else {
            return
        }
        inputViewBottom.constant = rect.height
    }

    // TextViewの高さ調節
    func changeTextViewHeight() {

        let maxHeight:CGFloat = 100.0
        let size = textView.sizeThatFits(textView.frame.size)

        if size.height <= maxHeight {
            textViewHeight.constant = size.height
            textView.isScrollEnabled = false
        }else {
            textViewHeight.constant = maxHeight
            textView.isScrollEnabled = true
        }
    }

    // 送信ボタンの処理
    @IBAction func didTapSend() {

        MessageDao.add(message: textView.text)

        textView.text = ""
        textView.endEditing(true)

        sendButton.isEnabled = false
        changeTextViewHeight()

        reloadMessageList()
    }
}

// MARK: - KeyboardNotification
private extension MessageListViewController {

    @objc func keyboardWillShow(notification: Notification) {
        changeTextViewBottom(notification: notification)
    }

    @objc func keyboardWillChangeFrame(notification: Notification) {
        changeTextViewBottom(notification: notification)
    }

    @objc func keyboardWillHide() {
        inputViewBottom.constant = 0
    }
}

// MARK: - UITableViewDelegate
extension MessageListViewController: UITableViewDelegate {

    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        textView.endEditing(true)
    }
}

// MARK: - UITextViewDelegate
extension MessageListViewController: UITextViewDelegate {

    func textViewDidChange(_ textView: UITextView) {

        let text = textView.text.trimmingCharacters(in: .whitespacesAndNewlines).uppercased()

        if !text.isEmpty {
            sendButton.isEnabled = true
        }else {
            sendButton.isEnabled = false
        }

        changeTextViewHeight()
    }
}
