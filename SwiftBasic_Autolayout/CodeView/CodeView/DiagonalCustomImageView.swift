//
//  DiagonalCustomImageView.swift
//  CodeView
//
//  Created by 김준석 on 2020/04/12.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

// カスタムコード　-> StoryBoardの画面にてすぐ確認する方法　@IBDesignable
@IBDesignable
class DiagonalCustomImageView: UIImageView {
    
    // StoryBoardにて入力できるようにする
    @IBInspectable var innerHeight: CGFloat = 0
    
    // 斜めに切られた四角形を描く
    // bezierPath
    func makePath() -> UIBezierPath {
        let path = UIBezierPath()
        //path.move(to: CGPoint.init(x: 0, y: 0))
        path.move(to: CGPoint.zero)
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: 0))
        path.addLine(to: CGPoint.init(x: self.bounds.width, y: self.bounds.height))
        path.addLine(to: CGPoint.init(x: 0, y: self.bounds.height - innerHeight))
        path.close()
        
        return path
    }
    // path -> layer
    func pathToLayer() -> CAShapeLayer {
        let shapeLayer = CAShapeLayer()
        shapeLayer.path = makePath().cgPath
        
        return shapeLayer
    }
    // layer -> mask
    func makeMask() {
        self.layer.mask = pathToLayer()
    }
    
    // ViewをaddSubviewした時、Viewのframeを変更した時（親ビューのlayoutSubviews経由、画面回転時など）に呼ばれる
    override func layoutSubviews() {
        makeMask()
    }
    
}
