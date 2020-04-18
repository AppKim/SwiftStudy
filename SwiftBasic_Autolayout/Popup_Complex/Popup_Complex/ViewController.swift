//
//  ViewController.swift
//  Popup_Complex
//
//  Created by 김준석 on 2020/04/14.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    @IBAction func showPopup(_ sender: Any) {
        // popupViewController
        
        let storyBoard = UIStoryboard.init(name: "PopupViewController", bundle: nil)
        // 해당 뷰컨트롤러를 가져오는는 공식
        let popupVC = storyBoard.instantiateViewController(withIdentifier: "popupVC")
        //  해당 뷰컨트롤러를 프레젠트방식으로 뛰어줌
        self.present(popupVC, animated: false, completion: nil)
        
        popupVC.modalPresentationStyle = .overCurrentContext
    }
    
}

