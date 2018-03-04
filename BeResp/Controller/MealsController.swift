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
        Meal(with: "Pizza Diavola", ingredients: "Tomates, mozza, salami, poivron, olives", image: "marche_bio", price: 7.99),
        Meal(with: "Ciabatta Carpaccio", ingredients: "Pain, mozza, tomates, câpres, huils d'olives, pesto", image: "marche_bio", price: 6.99),
        Meal(with: "Clabatta Vitello Tonato", ingredients: "Pain, poulet fris, salade, tomate", image: "marche_bio", price: 5.40),
        Meal(with: "Caprese Salada", ingredients: "Tomates, mozza, huile d'olive", image: "marche_bio", price: 2.00)
    ]
    
    override private init () {}
    
    func getMeals() -> [Meal] {
        return meals
    }
}


