//
//  RatingView.swift
//  Meal_Clone
//
//  Created by 김준석 on 2020/02/24.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class RatingView: UIStackView {
    
    private var ratingButtons: [UIButton] = []
    public var rating = 0 {
        didSet{
            updateButtonSelectionState()
        }
    }// 0 - 5
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        setupButton()
    }

    required init(coder: NSCoder) {
        super.init(coder: coder)
        setupButton()
    }
    
    func setupButton() {
        // buttonの間隔
        self.spacing = 10
        
        let filledStar = UIImage(named: "filledStar")
        let emptyStar = UIImage(named: "emptyStar")
        let highlightedStar = UIImage(named: "highlightedStar")
        
        for _ in 0..<5 {
            
            let button = UIButton()
            
            // buttonサイズ設定
            button.widthAnchor.constraint(equalToConstant: 40).isActive = true
            button.heightAnchor.constraint(equalToConstant: 40).isActive = true
            
            button.setImage(filledStar, for: .selected)
            button.setImage(emptyStar, for: .normal)
            button.setImage(highlightedStar, for: .highlighted)
            
            // StackView場合のみaddArrangedSubview
            self.addArrangedSubview(button)
            ratingButtons.append(button)
        
        }
    
    }
    
    func updateButtonSelectionState() {
        for (index, button) in ratingButtons.enumerated(){
            button.isSelected = index < self.rating
        }
    }
}
