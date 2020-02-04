//
//  ViewController.swift
//  Gesture_1
//
//  Created by 김준석 on 2020/02/03.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var centerY: NSLayoutConstraint!
    @IBOutlet weak var centerX: NSLayoutConstraint!
    @IBOutlet weak var avengersImageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let left = UISwipeGestureRecognizer(target: self, action: #selector(move))
        
        left.direction = .left
        
        let right = UISwipeGestureRecognizer(target: self, action: #selector(move))
        
        right.direction = .right
        
        let up = UISwipeGestureRecognizer(target: self, action: #selector(move))
        
        up.direction = .up
        
        let down = UISwipeGestureRecognizer(target: self, action: #selector(move))
        
        down.direction = .down
        
        self.view.addGestureRecognizer(left)
        self.view.addGestureRecognizer(right)
        self.view.addGestureRecognizer(up)
        self.view.addGestureRecognizer(down)
        
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(move))
        
        self.view.addGestureRecognizer(tap)
        
        
        }
    
    @objc func move(sender: UIGestureRecognizer){
        
        if sender is UITapGestureRecognizer{
            centerY.constant = 0
            centerX.constant = 0
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    
        if let swipe = sender as? UISwipeGestureRecognizer{
    
            switch swipe.direction {
                case UISwipeGestureRecognizer.Direction.left:
                
                    centerX.constant = centerX.constant - 50
                
                    print("left")
                case .right:
                
                    centerX.constant = centerX.constant + 50
                
                    print("right")
                case .up:
                
                    centerY.constant = centerY.constant - 50
                
                    print("up")
                case .down:
                
                    centerY.constant = centerY.constant + 50
                
                    print("down")
                default:
                break
            }
            
            UIView.animate(withDuration: 0.3) {
                self.view.layoutIfNeeded()
            }
        }
    }
}

