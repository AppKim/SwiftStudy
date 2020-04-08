//
//  FloationgButtonListViewController.swift
//  Floating_Button
//
//  Created by 김준석 on 2020/04/07.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class FloatingButtonListViewController: UIViewController {
    @IBOutlet weak var btn1CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn2CenterY: NSLayoutConstraint!
    @IBOutlet weak var btn3CenterY: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        btn1CenterY.constant = 0
        btn2CenterY.constant = 0
        btn3CenterY.constant = 0

    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        /*
        btn1CenterY.constant = 80
        btn2CenterY.constant = 160
        btn3CenterY.constant = 240
        */
       
        
        // レギュラーアニメーイション
        /*
        UIView.animate(withDuration: 1) {
            
            // closure内ではselfを指定してあげる必要がある
            // animate外でも問題ない
            self.btn1CenterY.constant = 80
            self.btn2CenterY.constant = 160
            self.btn3CenterY.constant = 240
            
            // 1秒間隔で画面の更新
            self.view.layoutIfNeeded()
            
        }
        */
        
        //　少し揺れるアニメーイションにしたい場合
        UIView.animate(withDuration: 1, delay: 0, usingSpringWithDamping: 0.6, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
            
            // closure内ではselfを指定してあげる必要がある
            // animate外でも問題ない
            self.btn1CenterY.constant = 80
            self.btn2CenterY.constant = 160
            self.btn3CenterY.constant = 240
            
            // 1秒間隔で画面の更新
            self.view.layoutIfNeeded()
            
        }) { (completion) in
            
            // アニメイションが終わる時点
        }
        
        
    }
    @IBAction func dismissFloating(_ sender: Any) {
        
        //　少し揺れるアニメーイションにしたい場合
        // damping:振幅の大きさを指定
        // velocity:初速を変更
        UIView.animate(withDuration: 0.7, delay: 0, usingSpringWithDamping: 0.8, initialSpringVelocity: 0.5, options: .curveEaseOut, animations: {
                
                // closure内ではselfを指定してあげる必要がある
                // animate外でも問題ない
                self.btn1CenterY.constant = 0
                self.btn2CenterY.constant = 0
                self.btn3CenterY.constant = 0
                
                // 1秒間隔で画面の更新
                // 必ず宣言
                self.view.layoutIfNeeded()
                
            }) { (completion) in
                
                // アニメーイションが終わる時点
                self.dismiss(animated: false, completion: nil)
            }
            
            
    }
    @IBAction func food3Action(_ sender: Any) {
        
        print("food3 selected")
        
    }
    
}
    

    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */


