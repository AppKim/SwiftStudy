//
//  ViewController.swift
//  Q_Alert
//
//  Created by 김준석 on 2020/02/08.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func displayAlert(_ sender: Any) {
        
        // 알러트객체를 인스턴스화(팝업창식)
        //let alert = UIAlertController(title: nil, message: "選択してください。", preferredStyle: .alert)
        
        // 알러트객체를 인스턴스화(액션시트식)
        let alert = UIAlertController(title: nil, message: "選択してください。", preferredStyle: .actionSheet)
        
        
        // 삭제 알러트
        let delete = UIAlertAction(title: "削除", style: .default, handler: nil)
        // 저장 알러트
        let save = UIAlertAction(title: "保存", style: .default) { (action) in
            // 저장버튼 눌러을 때 실행할 코드
        }
        // 취소 알러트(취소버튼이 같이표시되지만 빨간글자로 표시)
        let cancel = UIAlertAction(title: "取消", style: .destructive, handler: nil)
        // 취소 알러트(취소버튼이 별개로 분리되어서 표시)
        //let cancel = UIAlertAction(title: "取消", style: .cancel, handler: nil)
        
        // 액션추가
        alert.addAction(delete)
        alert.addAction(save)
        alert.addAction(cancel)
        
        // 화면에삽입
        self.present(alert, animated: true, completion: nil)
        
    }



}

