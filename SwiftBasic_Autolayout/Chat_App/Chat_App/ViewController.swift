//
//  ViewController.swift
//  Chat_App
//
//  Created by 김준석 on 2020/04/24.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var chatTableView: UITableView!
    @IBOutlet weak var inputTextView: UITextView!
    @IBOutlet weak var inputViewBottomMargin: NSLayoutConstraint!
    
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
        
    }
    
    @objc func keyboardWillShow(noti: Notification) {
        
    }
    
    @objc func keyboardWillHide(noti: Notification) {
        
    }
    
    
    @IBAction func sendString(_ sender: Any) {
        
    }
    

}

