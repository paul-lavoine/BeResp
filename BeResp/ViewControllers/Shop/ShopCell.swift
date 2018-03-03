//
//  ShopCell.swift
//  BeResp
//
//  Created by Paul Lavoine on 03/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

struct ShopCellConstant {
    static let reuseIdentifier    = "ShopCell"
    static let nib                = UINib(nibName: "ShopCell", bundle: nil)
}

class ShopCell: UITableViewCell {
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var shopImageView: UIImageView!
    
    @IBOutlet weak var informationRoundedContainerView: UIView!
    @IBOutlet weak var informationContainerView: UIView!
    
    @IBOutlet weak var shopTitleLabel: UILabel!
    @IBOutlet weak var shopCategoryLabel: UILabel!
    @IBOutlet weak var openningTimeLabel: UILabel!
    
    @IBOutlet weak var priceTypeLabel: UILabel!
    
    @IBOutlet weak var ratingContainerView: UIView!
    @IBOutlet weak var ratingRoundedView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        shopImageView.layer.cornerRadius = 5.0
        informationRoundedContainerView.layer.cornerRadius = 15.0
        ratingRoundedView.layer.cornerRadius = 8.0
        
      /*  let shadowPath = UIBezierPath(rect: containerView.bounds)
        containerView.layer.masksToBounds = false
        containerView.layer.shadowColor = UIColor.black.cgColor
        containerView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        containerView.layer.shadowRadius = 10.0
        containerView.layer.shadowOpacity = 0.5
        containerView.layer.shadowPath = shadowPath.cgPath
        */
        let ratingShadowPath = UIBezierPath(rect: ratingRoundedView.bounds)
        ratingRoundedView.layer.masksToBounds = false
        ratingRoundedView.layer.shadowColor = UIColor.black.cgColor
        ratingRoundedView.layer.shadowOffset = CGSize(width: 3.0, height: 3.0)
        ratingRoundedView.layer.shadowRadius = 10.0
        ratingRoundedView.layer.shadowOpacity = 0.5
        ratingRoundedView.layer.shadowPath = ratingShadowPath.cgPath
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        contentView.frame = UIEdgeInsetsInsetRect(contentView.frame, UIEdgeInsetsMake(ShopsViewController.cellSpacing, 0, ShopsViewController.cellSpacing, 0))
    }
    
    func configure(with shop: Shop) {
        shopTitleLabel.text = shop.title
        shopCategoryLabel.text = shop.category.rawValue
        openningTimeLabel.text = shop.openningTime
        priceTypeLabel.text = "€€"
        shopImageView.image = shop.image
        ratingLabel.text = String(shop.rate)
    }
}
