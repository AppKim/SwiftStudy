//
//  ViewController.swift
//  SignIn
//
//  Created by 김준석 on 2020/04/20.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTestField: UITextField!
    
    @IBOutlet weak var emailCaution: UITextField!
    
    @IBOutlet weak var passwordCaution: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textfield 値の変化を自動的に検知することがない
        // eventが発生した際に何か実行したい場合はaddTargetをよく使う
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: UIControl.Event.editingChanged)
        passwordTestField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)

    }
    
    @objc func textFieldEdited(textField: UITextField) {
        
        if textField == emailTextField {
            print("emailTextField\(textField.text!)")
        }else if textField == passwordTestField {
            print("passwordTextField\(textField.text!)")
        }
        
    }

    


}

