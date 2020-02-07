//
//  LoginViewController.swift
//  Q_Delegate
//
//  Created by 김준석 on 2020/02/07.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

protocol LoginInfo {
    func load(id: String)
}

class LoginViewController: UIViewController {
    
    var delegate: LoginInfo?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    
    @IBAction func doChanged(_ sender: UITextField) {
        delegate?.load(id: sender.text ?? "")
    }
}
