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
    
    var emailCautionHeight: NSLayoutConstraint!
    var passwordCautionHeight: NSLayoutConstraint!
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // textfield 値の変化を自動的に検知することがない
        // eventが発生した際に何か実行したい場合はaddTargetをよく使う
        emailTextField.addTarget(self, action: #selector(textFieldEdited), for: UIControl.Event.editingChanged)
        passwordTestField.addTarget(self, action: #selector(textFieldEdited), for: .editingChanged)
        
        emailCautionHeight = emailCaution.heightAnchor.constraint(equalToConstant: 0)
        passwordCautionHeight = passwordCaution.heightAnchor.constraint(equalToConstant: 0)

    }
    
    @objc func textFieldEdited(textField: UITextField) {
        
        if textField == emailTextField {
            print("emailTextField\(textField.text!)")
            
            if isValidEmail(email: textField.text) == true {
                // labelの高さを0に設定し、エラーを非表示
                emailCautionHeight.isActive = true
            }else{
                emailCautionHeight.isActive = false
            }
            
        }else if textField == passwordTestField {
            print("passwordTextField\(textField.text!)")
            
            if isVaildPaasword(pw: textField.text) {
                passwordCautionHeight.isActive = true
            }else{
                passwordCautionHeight.isActive = false
            }
        }
        
        // animate同期化
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
    }
    
    // 正規表現 - regular expression
    // validate an email for the right format
    func isValidEmail(email:String?) -> Bool {
        
        guard email != nil else { return false }
        
        let regEx = "[A-Z0-9a-z._%+-]+@[A-Za-z0-9.-]+\\.[A-Za-z]{2,}"
        
        let pred = NSPredicate(format:"SELF MATCHES %@", regEx)
        return pred.evaluate(with: email)
    }

    func isVaildPaasword(pw: String?) -> Bool {
        if let hasPassword = pw {
            if hasPassword.count < 8 {
                return false
            }
        }
        return true
    }


}

