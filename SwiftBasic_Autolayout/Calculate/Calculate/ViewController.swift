//
//  ViewController.swift
//  Calculate
//
//  Created by 김준석 on 2020/03/22.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var resultLabel: UILabel!
    @IBOutlet weak var btn_1: UIButton!
    @IBOutlet weak var btn_2: UIButton!
    @IBOutlet weak var btn_3: UIButton!
    @IBOutlet weak var btn_4: UIButton!
    @IBOutlet weak var btn_5: UIButton!
    @IBOutlet weak var btn_6: UIButton!
    @IBOutlet weak var btn_7: UIButton!
    @IBOutlet weak var btn_8: UIButton!
    @IBOutlet weak var btn_9: UIButton!
    @IBOutlet weak var btn_10: UIButton!
    @IBOutlet weak var btn_11: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        resultLabel.layer.cornerRadius = 20
        resultLabel.clipsToBounds = true
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        // 스택뷰를 너무 많이 사용하면 퍼포먼스가 떨어질수도있으나 20-30개이상이 아닌경우 체감할수없음
        // IPhoneX계열은 콘테츠들이 길어질려고하는경향이있으므로 콘스트레인츠의 우선순위로 조정을 할수있고 콘테츠사이즈는 크기의 범위를 정하므로서 어떤디바이스에서도 콘테츠가 잘리거나 밀리거나 하는 현상을 막을수있다.
        btn_1.layer.cornerRadius = btn_1.bounds.width / 2
        btn_2.layer.cornerRadius = btn_2.bounds.width / 2
        btn_3.layer.cornerRadius = btn_3.bounds.width / 2
        btn_4.layer.cornerRadius = btn_4.bounds.width / 2
        btn_5.layer.cornerRadius = btn_5.bounds.width / 2
        btn_6.layer.cornerRadius = btn_6.bounds.width / 2
        btn_7.layer.cornerRadius = btn_7.bounds.width / 2
        btn_8.layer.cornerRadius = btn_8.bounds.width / 2
        btn_9.layer.cornerRadius = btn_9.bounds.width / 2
        btn_10.layer.cornerRadius = btn_10.bounds.height / 2
        btn_11.layer.cornerRadius = btn_11.bounds.width / 2
        
    }
    @IBAction func btnAction(_ sender: Any) {
        resultLabel.text = "press1"
    }
    

}

