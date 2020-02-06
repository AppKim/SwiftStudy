//
//  ViewController.swift
//  ShowKeyboard
//
//  Created by 김준석 on 2020/02/06.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    @IBOutlet weak var myTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        super.viewWillAppear(animated)
        myTextField.becomeFirstResponder()
    }
    
    @IBAction func hideKeyboard(_ sender: Any) {
        //myTextField.resignFirstResponder()
        myTextField.endEditing(true)
    }
    
    
}

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }


}

