//
//  ViewController.swift
//  Chat_App
//
//  Created by 김준석 on 2020/04/24.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

extension ChatVC{
    
     func initializeHideKeyboard(){
        //Declare a Tap Gesture Recognizer which will trigger our dismissMyKeyboard() function
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(
            target: self,
            action: #selector(dismissMyKeyboard))
        
        //Add this tap gesture recognizer to the parent view
        view.addGestureRecognizer(tap)
    }
    
    @objc func dismissMyKeyboard(){
        //endEditing causes the view (or one of its embedded text fields) to resign the first responder status.
        //In short- Dismiss the active keyboard.
        view.endEditing(true)
    }
}


class ViewController: UIViewController{

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var inputViewButtonMargin: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        // 使用するセルを登録しなければならないため
        chatTableView.register(UINib(nibName: "MyCell", bundle: nil), forCellReuseIdentifier: "myCell")
        chatTableView.register(UINib(nibName: "YourCell", bundle: nil), forCellReuseIdentifier: "yourCell")
        
        // キーボードの状態を知らせてくれる
        // 키보드 관련 옵저버 설정을 해야 함
        // 키보드가 올라올때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillShow), name: UIResponder.keyboardWillShowNotification, object: nil)
        // 키보드가 내려올때
        NotificationCenter.default.addObserver(self, selector: #selector(keyboardWillHide), name: UIResponder.keyboardWillHideNotification, object: nil)
        initializeHideKeyboard()
        
    }
    
    @objc func keyboardWillShow(noti: Notification) {
        let notiInfo = noti.userInfo!
        let keyboardFrame = notiInfo[UIResponder.keyboardFrameEndUserInfoKey]
        as! CGRect
        let height = keyboardFrame.size.height - self.view.safeAreaInsets.bottom
        
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        
        UIView.animate(withDuration: animationDuration) {
            self.inputViewButtonMargin.constant = height
            self.view.layoutIfNeeded()
        }
        
        
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        // 테이블뷰내에서 어떤조작을 하였을때 키보드를 내려가게 하고싶을경우에는 inspectore에서 키보드에 대한 설정을 Do Not Dismiss에서 Dismiss On Drage로 설정
        let notiInfo = noti.userInfo!
        let animationDuration = notiInfo[UIResponder.keyboardAnimationDurationUserInfoKey] as! TimeInterval
        UIView.animate(withDuration: animationDuration) {
            self.inputViewButtonMargin.constant = 0
        }
        
        
    }
    
    
    @IBAction func sendString(_ sender: Any) {
        
    }
    
}

