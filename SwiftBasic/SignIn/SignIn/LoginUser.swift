//
//  LoginUser.swift
//  SignIn
//
//  Created by 김준석 on 2020/02/15.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

struct LoginUser: Codable {
    
    init() {
        name = ""
        password = ""
        email = ""
        id = 0
        locations = [LocationModel]()
    }
    
    struct LocationModel: Codable {
        
        let city: String
        let state: String
        
    }
    
    let name: String?
    let password : String?
    let email: String?
    let id: Int?
    let locations: [LocationModel]?
    
}

