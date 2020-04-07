//
//  ViewController.swift
//  Floating_Button
//
//  Created by 김준석 on 2020/04/06.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "shopPopup" {
            
            // FloatingButtonListViewControllerを取得
            // 쇼로연결했을때 세그웨이옵션에서 에니메이션 제거해줘야지 위에서올라오는 애니메이션사라짐
            let floatingVC = segue.destination as! FloatingButtonListViewController
            // FloatingButtonListViewControllerのモーダルを透明にする
            floatingVC.modalPresentationStyle = .overCurrentContext
            
            
        }
        
    }


}

