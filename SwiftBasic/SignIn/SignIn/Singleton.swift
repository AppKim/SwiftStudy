//
//  Singleton.swift
//  SignIn
//
//  Created by 김준석 on 2020/02/18.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

// singletone インスタンスが一度生成されたら継続的に維持されて値が同じになること
// 인스턴스가 한번생성되면 계속 유지되서 같은값을 나오게 하는 형태


class Singleton: NSObject {
    
    class User {
        
        // 値が変わらないように一回だけインスタンスが生成されるように
        // Class内で直接呼び出せるのはstaticのみ
        static let shared = User()
        var info = LoginUser()
        
        // 値が初期化出来ないようにする
        private init() {
            
        }
        
    }

}

