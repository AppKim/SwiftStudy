//
//  Common.swift
//  SignIn
//
//  Created by 김준석 on 2020/02/15.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

// queryString生成
extension Dictionary {
    var queryString: String{
        var output = ""
        for (key,value) in self{
            output = output + "\(key)=\(value)&"
        }
        // Casting
        output = String(output.dropLast())
        return output
    }
}
