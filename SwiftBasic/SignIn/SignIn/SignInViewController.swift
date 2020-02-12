//
//  SignInViewController.swift
//  SignIn
//
//  Created by 김준석 on 2020/02/11.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class SignInViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSignIn.layer.cornerRadius = buttonSignIn.bounds.size.height / 2
        buttonSignIn.layer.borderWidth = 1
        buttonSignIn.layer.borderColor = UIColor.blue.cgColor
        
        // 画面内のネービーゲイションバー隠し
        self.navigationController?.setNavigationBarHidden(true, animated: false)
     
    }
    
    @IBOutlet weak var buttonSignIn: UIButton!
    
    // メイン画面に遷移
    @IBAction func dismissVC(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    // 会員登録画面に遷移
    @IBAction func moveToSignUp(_ sender: Any) {
        
        let signUpVC = UIStoryboard(name: "SignUpVC", bundle: nil).instantiateViewController(identifier: "signUpVC")
        self.navigationController?.pushViewController(signUpVC, animated: true)
    }
}
