//
//  ViewController.swift
//  Button_Code
//
//  Created by 김준석 on 2020/03/22.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myButton = UIButton.init(type: .system)
        myButton.setTitle("My button", for: .normal)
        self.view.addSubview(myButton)
        
        
        // false:Autolayout , True:Frame
        myButton.translatesAutoresizingMaskIntoConstraints = false
        // constraintはdefaultとしてfalseのため、trueに設定してあげる必要がある
        myButton.centerXAnchor.constraint(equalTo: self.view.centerXAnchor).isActive = true
        //myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor).isActive = true
        myButton.centerYAnchor.constraint(equalTo: self.view.centerYAnchor, constant: -100).isActive = true
        
        // label設定
        //　位置：左から２０、上から２０
        let myLabel = UILabel.init()
        myLabel.text = "My Label"
        self.view.addSubview(myLabel)
        
        myLabel.translatesAutoresizingMaskIntoConstraints = false
        // self.view(SuperView)にてAnchorを設定することはない
        myLabel.topAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.topAnchor, constant: 20).isActive = true
        myLabel.leftAnchor.constraint(equalTo: self.view.safeAreaLayoutGuide.leftAnchor, constant: 20).isActive = true
        
        
    }


}


