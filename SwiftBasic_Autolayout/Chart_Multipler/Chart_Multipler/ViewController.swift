//
//  ViewController.swift
//  Chart_Multipler
//
//  Created by 김준석 on 2020/04/09.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

extension NSLayoutConstraint {
    // グラフの高さ調整
    func changeMultipler (value: CGFloat) -> NSLayoutConstraint{
        
        // constraintは値が重なる仕様なので、新しく値を設定するたびに非活性化が必要がある
        NSLayoutConstraint.deactivate([self])
        
        let newConstraint = NSLayoutConstraint.init(item: self.firstItem, attribute: self.firstAttribute, relatedBy: self.relation, toItem: self.secondItem, attribute: self.secondAttribute, multiplier: value, constant: self.constant)
        
        newConstraint.priority = self.priority
        newConstraint.shouldBeArchived = self.shouldBeArchived
        newConstraint.identifier = self.identifier
        
        NSLayoutConstraint.activate([newConstraint])
        
        return newConstraint
    }
}

class ViewController: UIViewController {

    @IBOutlet weak var graph1Height: NSLayoutConstraint!
    @IBOutlet weak var graph2Height: NSLayoutConstraint!
    @IBOutlet weak var graph3Height: NSLayoutConstraint!
    @IBOutlet weak var graph4Height: NSLayoutConstraint!
    @IBOutlet weak var graph5Height: NSLayoutConstraint!
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }
    // グラフのパターン1
    @IBAction func style1(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            
            self.graph1Height = self.graph1Height.changeMultipler(value: 0.5)
            self.graph2Height = self.graph2Height.changeMultipler(value: 0.6)
            self.graph3Height = self.graph3Height.changeMultipler(value: 0.7)
            self.graph4Height = self.graph4Height.changeMultipler(value: 0.8)
            self.graph5Height = self.graph5Height.changeMultipler(value: 0.9)
            // viewの同期化
            self.view.layoutIfNeeded()
            
        }
        
    }
    // グラフのパターン2
    @IBAction func style2(_ sender: Any) {
        UIView.animate(withDuration: 0.5) {
            
            self.graph1Height = self.graph1Height.changeMultipler(value: 0.9)
            self.graph2Height = self.graph2Height.changeMultipler(value: 0.8)
            self.graph3Height = self.graph3Height.changeMultipler(value: 0.7)
            self.graph4Height = self.graph4Height.changeMultipler(value: 0.6)
            self.graph5Height = self.graph5Height.changeMultipler(value: 0.5)
            // viewの同期化
            self.view.layoutIfNeeded()
            
        }
    }
    
    

}

