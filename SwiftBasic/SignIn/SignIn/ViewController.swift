//
//  ViewController.swift
//  SignIn
//
//  Created by 김준석 on 2020/02/11.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var userInfoLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NotificationCenter.default.addObserver(self, selector: #selector(infoReLoad), name: NSNotification.Name.init("UserInfoLoad"), object: nil)

    }
    
    @objc func infoReLoad() {
        DispatchQueue.main.async {
            self.userInfoLabel.text = Singleton.User.shared.info.email
        }
    }
    

    @IBAction func moveToSignIn(_ sender: Any) {
        // ログイン画面と連結
        // オブジェクト生成
        let signInVC = UIStoryboard(name: "SignInVC", bundle: nil).instantiateViewController(identifier: "naviSignIn")
        // signInVCを呼び出し
        self.present(signInVC, animated: true, completion: nil)
        
    }
    
}

