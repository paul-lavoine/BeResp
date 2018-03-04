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
    
    @IBOutlet weak var ratingRoundedView: UIView!
    @IBOutlet weak var ratingLabel: UILabel!
    
    @IBOutlet weak var tabsIndicatorView: UIView!
    @IBOutlet weak var firstTabButton: UIButton!
    @IBOutlet weak var secondTabButton: UIButton!
    @IBOutlet weak var thirdTabButton: UIButton!
    
    // Data
    var shop: Shop?
    var currentDisplay: CurrentDisplay = .description
    
    // Constraint
    @IBOutlet weak var tabsIndicatorLeadingConstraint: NSLayoutConstraint!
    
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
        ratingLabel.text = String(format:"%.1f", (shop?.rate)!)
        openningTimeLabel.text = shop?.openningTime
        localizationLabel.text = String(format:"%.1f KM", (shop?.distance!)!)
        extraLabel.text = "A EMPORTER"
        
        openningTimeImageView.tintColor = UIColor(red: 250.0/255/0, green: 171.0/255.0, blue: 142.0/255.0, alpha: 1)
        localizationImageView.tintColor = UIColor(red: 242.0/255/0, green: 188.0/255.0, blue: 154.0/255.0, alpha: 1)
        extraImageView.tintColor = UIColor(red: 233.0/255/0, green: 142.0/255.0, blue: 174.0/255.0, alpha: 1)
        
        // Rating View
        ratingRoundedView.layer.cornerRadius = 8.0
        let ratingShadowPath = UIBezierPath(rect: ratingRoundedView.bounds)
        ratingRoundedView.layer.masksToBounds = false
        ratingRoundedView.layer.shadowColor = UIColor.black.cgColor
        ratingRoundedView.layer.shadowOffset = CGSize(width: 0.0, height: 10.0)
        ratingRoundedView.layer.shadowRadius = 6.0
        ratingRoundedView.layer.shadowOpacity = 0.3
        ratingRoundedView.layer.shadowPath = ratingShadowPath.cgPath
    }
    
    // Actions
    @IBAction func showDescription(_ sender: Any) {
        animeTabs(display: .description)
    }
    
    @IBAction func showMenu(_ sender: Any) {
        animeTabs(display: .menu)
    }
    
    @IBAction func showComment(_ sender: Any) {
        animeTabs(display: .comment)
    }
    
    @IBAction func closeAction(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
    // Animations
    func animeTabs(display: CurrentDisplay) {
        if currentDisplay == display {
            return
        }
        
        resetTabsLabel()
        currentDisplay = display
        var tappedButton: UIButton?
        
        switch currentDisplay {
        case .description:
            tabsIndicatorLeadingConstraint.constant = 0
            tappedButton = firstTabButton
            break
        case .menu:
            tabsIndicatorLeadingConstraint.constant = self.view.frame.width / 2 - tabsIndicatorView.frame.width / 2
            tappedButton = secondTabButton
            break
        case .comment:
            tabsIndicatorLeadingConstraint.constant = self.view.frame.width - tabsIndicatorView.frame.width
            tappedButton = thirdTabButton
            break
        }
        
        UIView.animate(withDuration: 0.3) {
            self.view.layoutIfNeeded()
        }
        
        tappedButton?.setTitleColor(.black, for: .normal)
        tappedButton?.titleLabel?.font = UIFont.systemFont(ofSize: 15.0)
    }
    
    // Utils
    func resetTabsLabel() {
        firstTabButton.setTitleColor(.gray, for: .normal)
        secondTabButton.setTitleColor(.gray, for: .normal)
        thirdTabButton.setTitleColor(.gray, for: .normal)
        firstTabButton.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        secondTabButton.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
        thirdTabButton.titleLabel?.font = UIFont.systemFont(ofSize: 13.0)
    }
}
