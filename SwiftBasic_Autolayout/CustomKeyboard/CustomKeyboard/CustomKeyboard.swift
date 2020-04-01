//
//  CustomKeyboard.swift
//  CustomKeyboard
//
//  Created by 김준석 on 2020/03/29.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

// delegate

protocol CustomKeyboardDelegate {
    
    func keyBoardTapeed(str : String)
}

class CustomKeyboard: UIView {
    
    // デリゲートはMemory Leak Preventionのため、必ずOptionalType
    var delegate : CustomKeyboardDelegate?
    
    @IBAction func buttonTapped(_ sender: UIButton) {
        
        delegate?.keyBoardTapeed(str: sender.titleLabel!.text!)
        
    }
    
}
