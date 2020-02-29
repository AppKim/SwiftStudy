//
//  MealModel.swift
//  Meal_Clone
//
//  Created by 김준석 on 2020/02/24.
//  Copyright © 2020 Kim JunSeok. All rights reserved.
//

import UIKit

class MealModel: NSObject,NSCoding,NSSecureCoding{
    // NSSecureCodingはNSKeyedArchiverのios12バージョンの場合実装
    // requiringSecureCoding: trueにする場合のみ
    static var supportsSecureCoding: Bool {
        return true
    }
    
    // archiveする際の必須実装　NSObject,NScoding
    func encode(with coder: NSCoder) {
        coder.encode(name, forKey: "name")
        coder.encode(photo, forKey: "photo")
        coder.encode(rating, forKey: "rating")
    }
    // archiveする際の必須実装 NSObject,NScoding
    required convenience init?(coder: NSCoder) {
        let name = coder.decodeObject(forKey: "name") as! String
        let photo = coder.decodeObject(forKey: "photo") as? UIImage
        let rating = coder.decodeInteger(forKey: "rating")
        
        self.init(name: name,photo: photo,rating: rating)
        
    }
    
    var name: String
    var photo: UIImage?
    var rating: Int
    
    override init() {
        self.name = ""
        self.rating = 0
    }
    
    init(name: String, photo: UIImage?, rating: Int){
        self.name = name
        self.photo = photo
        self.rating = rating
    }
    
}
