//
//  Shop.swift
//  BeResp
//
//  Created by Paul Lavoine on 03/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

enum ShopCategory: String {
    case bio        = "Supermarché bio"
    case marche     = "Marché"
    case epicerie   = "Épicerie fine et art de la table"
    case food   = "Foodtruc, Fast Food"
}

enum ShopPrice: Int {
    case cheap      = 1
    case medium     = 2
    case expensive  = 3
}

class Shop: NSObject {
    // MARK: - Properties
    var uid: String?
    var title: String!
    var latitude: Double?
    var longitude: Double?
    var category: ShopCategory!
    var image: UIImage!
    var openningTime: String!
    var information: String!
    var price: ShopPrice!
    var rate: Double!
    var distance: Double!
    var comments: [String] = []
    var commentsCount: Int!
    
    init(with title:String, category: ShopCategory, image: String, openningTime: String, information: String, price: ShopPrice, rate: Double, commentsCount: Int, distance: Double) {
        super.init()
        
        self.title = title
        self.category = category
        self.image = UIImage(named: image)
        self.openningTime = openningTime
        self.information = information
        self.price = price
        self.rate = rate
        self.commentsCount = commentsCount
        self.distance = distance
    }
}
