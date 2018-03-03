//
//  ShopsController.swift
//  BeResp
//
//  Created by Paul Lavoine on 03/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import Foundation

class ShopsController: NSObject {
    static let shared = ShopsController()
    
    var shops: [Shop] = [
        Shop(with: "Le Marchand Bio", category: .bio, image: "marche_bio", openningTime: "9:00-19:00", information: "", price:.medium, rate: 4.8, commentsCount: 72),
        Shop(with: "Le comptoir d'Edgar", category: .epicerie, image: "marche_bio", openningTime: "10:00-19:00", information: "", price:.cheap, rate: 4.3, commentsCount: 16),
        Shop(with: "Biocool", category: .bio, image: "marche_bio", openningTime: "8:30-19:00", information: "", price:.medium, rate: 3.0, commentsCount: 5),
        Shop(with: "Le marché de nos villes", category: .marche, image: "marche_bio", openningTime: "9:00-18:00", information: "", price:.expensive, rate: 4.5, commentsCount: 64)
    ]
    
    override private init () {}
    
    func getShops() -> [Shop] {
        return shops
    }
    
    func nearestShop() -> Shop {
        return shops[0]
    }
}

