//
//  Meal.swift
//  BeResp
//
//  Created by Paul Lavoine on 03/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class Meal: NSObject {
    // MARK: - Properties
    var uid: String?
    var title: String!
    var ingredients: String!
    var image: UIImage!
    var price: String!
    
    init(with title:String, ingredients: String, image: String, price: String) {
        super.init()
        
        self.title = title
        self.ingredients = ingredients
        self.image = UIImage(named: image)
        self.price = price
    }
}
