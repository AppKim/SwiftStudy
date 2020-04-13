//
//  ViewController.swift
//  Switch_Custom
//
//  Created by 김준석 on 2020/04/13.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var switchBtn: UIButton!
    @IBOutlet weak var switchBG: UIView!
    @IBOutlet weak var buttonCenterX: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        switchBtn.layer.cornerRadius = 50 / 2 
        switchBG.layer.cornerRadius = 50 / 2
    }
    
    
    @IBAction func selectedButton(_ sender: Any) {
        
        UIView.animate(withDuration: 0.5) {
            if self.buttonCenterX.constant == 75 {
                self.buttonCenterX.constant = -75
                self.switchBG.backgroundColor = UIColor.lightGray
            }else{
                self.buttonCenterX.constant = 75
                self.switchBG.backgroundColor = UIColor.yellow
            }
            self.view.layoutIfNeeded()
        }
        
        
        
    }
    

}

