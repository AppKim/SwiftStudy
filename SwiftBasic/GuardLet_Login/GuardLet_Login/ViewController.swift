//
//  ViewController.swift
//  GuardLet_Login
//
//  Created by 김준석 on 2020/02/05.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var alertLabel: UILabel!
    
    @IBOutlet weak var usernameField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        alertLabel.text = ""
        alertLabel.textColor = UIColor.red
        
        
    }
    
    @IBAction func doneLogin(_ sender: Any) {
        guard let username = usernameField.text, username.count > 0 else{
            alertLabel.text = "username is Empty"
            return
        }
        guard let password = passwordField.text, password.count > 0 else {
            alertLabel.text = "password is Empty"
            return
        }
        
        if username == "kim" && password == "123" {
            alertLabel.text = "login Success"
        }else{
            alertLabel.text = "login Fail"
        }
    }
    


}

