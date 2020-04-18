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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func closePupup(_ sender: Any) {
        self.dismiss(animated: false, completion: nil)
    }
    
    
}
