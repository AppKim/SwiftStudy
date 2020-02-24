//
//  MealModel.swift
//  Meal_Clone
//
//  Created by 김준석 on 2020/02/24.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

struct MealModel{
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    init() {
        self.name = ""
        self.rating = 0
    }
    
    init(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
    

}
