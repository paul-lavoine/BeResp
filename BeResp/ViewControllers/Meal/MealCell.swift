//
//  MealCell.swift
//  BeResp
//
//  Created by Paul Lavoine on 04/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

struct MealCellConstant {
    static let reuseIdentifier    = "MenuCell"
    static let nib                = UINib(nibName: "MenuCell", bundle: nil)
}

class MealCell: UITableViewCell {

    override func awakeFromNib() {
        super.awakeFromNib()
    }
    
    func configure(with meal: Meal) {
        
    }
}
