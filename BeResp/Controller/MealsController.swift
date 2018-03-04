//
//  MealsController.swift
//  BeResp
//
//  Created by Paul Lavoine on 04/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import Foundation

class MealsController: NSObject {
    static let shared = MealsController()
    
    var meals: [Meal] = [
        
    ]
    
    override private init () {}
    
    func getMeals() -> [Meal] {
        return meals
    }
}


