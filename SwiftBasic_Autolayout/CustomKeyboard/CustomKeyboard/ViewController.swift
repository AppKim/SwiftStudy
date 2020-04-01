//
//  ViewController.swift
//  CustomKeyboard
//
//  Created by 김준석 on 2020/03/29.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController , CustomKeyboardDelegate{

    @IBOutlet weak var firstTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // CustomKeyboard Load
        let loadNib = Bundle.main.loadNibNamed("CustomKeyboard", owner: nil, options: nil)
        let myKeyboardView = loadNib?.first as! CustomKeyboard
        firstTextField.inputView = myKeyboardView
        // delegate
        myKeyboardView.delegate = self
    }
    
    // キーボード押下
    func keyBoardTapeed(str: String) {
        
        let oldNumber = Int(firstTextField.text!)
        var newNumber = Int(str)
        
        print(String(describing: oldNumber))
        if str == "00" && oldNumber != nil {
            newNumber = oldNumber! * 100
            print(String(describing: newNumber))
        }
        
        if str == "000" && oldNumber != nil {
            newNumber = oldNumber! * 1000
            print(String(describing: newNumber))
        }
        
        guard let hasNumber = newNumber else{
           return
        }
        
        let numberFormatter = NumberFormatter()
        numberFormatter.numberStyle = .decimal
        let formatted = numberFormatter.string(from: NSNumber(value: hasNumber))
        
        guard let hasFormatted = formatted else {
            return
        }
        
        firstTextField.text = String(describing: hasFormatted)
        
    }
    


}

