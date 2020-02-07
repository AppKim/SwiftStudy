//
//  ViewController.swift
//  CustomIndicateButton
//
//  Created by 김준석 on 2020/02/07.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var myButton: LoadingButton!
    
    var isLoading = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 버튼의 외곽선 설정
        myButton.layer.borderColor = UIColor.black.cgColor
        myButton.layer.borderWidth = 1
        
        // 버튼의 글자색 설정
        myButton.setTitleColor(UIColor.red, for: .normal)
        
    }

    @IBAction func doAction(_ sender: Any) {
        // isLoading = !isLoading
        // 스타트,스탑 플러그 설정
        isLoading.toggle()
        
        if isLoading {
            myButton.startLoading()
        }else {
            myButton.stopLoading()
        }
        
    }
}

