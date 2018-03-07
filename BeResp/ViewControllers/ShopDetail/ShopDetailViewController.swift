//
//  ShopDetailViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 03/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

enum CurrentDisplay {
    case description
    case menu
    case comment
}

class ShopDetailViewController: UIViewController {
    
    // IBOutlet
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    
    @IBOutlet weak var openningTimeImageView: UIImageView!
    @IBOutlet weak var openningTimeLabel: UILabel!
    
    @IBOutlet weak var localizationImageView: UIImageView!
    @IBOutlet weak var localizationLabel: UILabel!
    
    @IBOutlet weak var extraImageView: UIImageView!
    @IBOutlet weak var extraLabel: UILabel!

    @IBOutlet weak var descriptionLabel: UILabel!
    
    @IBOutlet weak var flagBadgeView: FlagBadge!
    
    // Data
    var shop: Shop?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        refreshUI()
    }
    
    func configure(with shop: Shop) {
        self.shop = shop
    }
    
    func refreshUI() {
        headerImageView.image = shop?.image
        titleLabel.text = shop?.title
        subtitleLabel.text = shop?.category.rawValue
        descriptionLabel.text = shop?.information
        flagBadgeView.configure(with: String(format:"%.1f", (shop?.rate)!))
        flagBadgeView.addShadow()
        openningTimeLabel.text = shop?.openningTime
        localizationLabel.text = String(format:"%.1f KM", (shop?.distance!)!)
        extraLabel.text = "A EMPORTER"
        
        openningTimeImageView.tintColor = UIColor(red: 250.0/255/0, green: 171.0/255.0, blue: 142.0/255.0, alpha: 1)
        localizationImageView.tintColor = UIColor(red: 242.0/255/0, green: 188.0/255.0, blue: 154.0/255.0, alpha: 1)
        extraImageView.tintColor = UIColor(red: 233.0/255/0, green: 142.0/255.0, blue: 174.0/255.0, alpha: 1)
    }
}
