//
//  SignUpViewController.swift
//  SignIn
//
//  Created by 김준석 on 2020/02/11.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class SignUpViewController: UIViewController {

    @IBOutlet weak var buttonSignUp: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        buttonSignUp.layer.cornerRadius = buttonSignUp.bounds.height / 2
        buttonSignUp.layer.borderWidth = 1
        buttonSignUp.layer.borderColor = UIColor.white.cgColor
        
    }
    
    // 指定NavigationControllerへ戻る
    @IBAction func popSignInVC(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}
