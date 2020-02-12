//
//  ViewController.swift
//  SignIn
//
//  Created by 김준석 on 2020/02/11.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func moveToSignIn(_ sender: Any) {
        // ログイン画面と連結
        // オブジェクト生成
        let signInVC = UIStoryboard(name: "SignInVC", bundle: nil).instantiateViewController(identifier: "naviSignIn")
        // signInVCを呼び出し
        self.present(signInVC, animated: true, completion: nil)
        
    }
    
}

