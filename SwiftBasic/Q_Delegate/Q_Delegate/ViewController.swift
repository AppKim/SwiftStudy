//
//  ViewController.swift
//  Q_Delegate
//
//  Created by 김준석 on 2020/02/07.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

// Delegate Pattern
// protocol

protocol Pname {
    func test()
    var myScore: Int { get }
}

class ViewController: UIViewController, LoginInfo{
    func load(id: String) {
        // 필요한 처리 구현
        userID.text = id
        
    }
    
    @IBOutlet weak var userID: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    // 로그인 컨트롤러와 연결
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "moveToLoginVC" {
            // 로그인 컨틀로러 인스턴스 생성
            let loginVC = segue.destination as! LoginViewController
            //
            loginVC.delegate = self
        }
        
        
    }


}

