//
//  PopupViewController.swift
//  Popup_Complex
//
//  Created by 김준석 on 2020/04/14.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class PopupViewController: UIViewController {

    /*
    // Only override draw() if you perform custom drawing.
    // An empty implementation adversely affects performance during animation.
    override func draw(_ rect: CGRect) {
        // Drawing code
    }
    */
    
    // 투명도 설정에는 Alpha와Opacity가있는데 Alpha는 뷰컨트롤러 전체를 투명하게 하고 Opacity는 해당하는 뷰만 투명하게 함
    
    // action이 필요한 객체일 경우 해당 뷰에 넣은 상태로 뷰에 걸치는 포지션을 할경우 뷰바깥에 뺀상태로 정렬을 해야 어느위치에 놓아도 버튼이 클릭된다
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePupup(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    @IBAction func doneAction(_ sender: Any) {
        print("press done action")
    }
    
}
