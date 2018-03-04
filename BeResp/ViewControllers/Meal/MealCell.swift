//
//  MealCell.swift
//  BeResp
//
//  Created by Paul Lavoine on 04/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

struct MealCellConstant {
    static let reuseIdentifier    = "MealCell"
    static let nib                = UINib(nibName: "MealCell", bundle: nil)
}

class MealCell: UITableViewCell {

    @IBOutlet weak var mealImageView: UIImageView!
    @IBOutlet weak var mealTitleLabel: UILabel!
    @IBOutlet weak var mealIngredientsLabel: UILabel!
    @IBOutlet weak var flagBadgeView: FlagBadge!
    
    func configure(with meal: Meal) {
        mealImageView.image = meal.image
        mealTitleLabel.text = meal.title
        mealIngredientsLabel.text = meal.ingredients
        
        flagBadgeView.configure(with: String(meal.price!) + "€", font: UIFont.boldSystemFont(ofSize: 10.0))
        flagBadgeView.addMealShadow()
        
        mealImageView.setNeedsLayout()
        mealImageView.layoutIfNeeded()
        mealImageView.layer.cornerRadius = mealImageView.frame.width / 2.0
    }
}
