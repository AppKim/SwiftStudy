//
//  ViewController.swift
//  Chat_App
//
//  Created by 김준석 on 2020/04/24.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource,UITextViewDelegate{

    @IBOutlet weak var chatTableView: UITableView!{
        didSet{
            chatTableView.delegate = self
            chatTableView.dataSource = self
            chatTableView.separatorStyle = .none
        }
    }
    
    var chatDatas = [String]()
    
    @IBOutlet weak var inputTextView: UITextView!{
        didSet{
            inputTextView.delegate = self
        }
    }
    
    @IBOutlet weak var inputTextViewHeight: NSLayoutConstraint!
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
        // 키보드 숨길때
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
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return chatDatas.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        if indexPath.row % 2 == 0 {
            let myCell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! MyCell
            myCell.myTextView.text = chatDatas[indexPath.row]
            // 셀선택스타일없애기
            myCell.selectionStyle = .none
            // 텍스트뷰 수정 불가능
            myCell.myTextView.isEditable = false
            return myCell
            
        }else{
            let yourCell = tableView.dequeueReusableCell(withIdentifier: "yourCell", for: indexPath) as! YourCell
            yourCell.yourTextView.text = chatDatas[indexPath.row]
            // 셀선택스타일없애기
            yourCell.selectionStyle = .none
            // 텍스트뷰 수정 불가능
            yourCell.yourTextView.isEditable = false
            return yourCell
        }
    }
    
    @IBAction func sendString(_ sender: Any) {
        
        // 데이터를 배열에 셋
        chatDatas.append(inputTextView.text)
        
        inputTextView.text = ""
        
        // 마지막인덱스값
        let lastIndexPath = IndexPath(row: chatDatas.count-1, section: 0)
        
        // 튀는 현상이 생기고 전체가 갱신되기 때문에 갱신할때 잘 사용하지 않는다
        //chatTableView.reloadData()
        
        // 마지막 데이터만 갱신
        chatTableView.insertRows(at: [lastIndexPath], with: .automatic)
        
        // 최신인덱스로 자동스크롤이동
        chatTableView.scrollToRow(at: lastIndexPath, at: .bottom, animated: true)
        
        // textfield컨텐츠 사이즈 초기화
        inputTextViewHeight.constant = 40
        
    }
    
    // textfield컨텐츠 사이즈 조정
    func textViewDidChange(_ textView: UITextView) {
        
        if textView.contentSize.height <= 40 {
            inputTextViewHeight.constant = 40
        }else if textView.contentSize.height >= 100 {
            inputTextViewHeight.constant = 100
        }else {
            inputTextViewHeight.constant = textView.contentSize.height
        }

    }
    
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

