//
//  MealDetailViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 04/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class MealDetailViewController: UIViewController {
    
    // IBOutlets
    @IBOutlet weak var headerImageView: UIImageView!
    @IBOutlet weak var gradientView: UIView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var flagBadgeView: FlagBadge!
    @IBOutlet weak var respButton: UIView!
    
    // Data
    var meal: Meal?
    
    override func viewDidLoad() {
        super.viewDidLoad()
     
        refreshUI()
    }
    
    func configure(with meal: Meal) {
        self.meal = meal
    }
    
    func refreshUI() {
        headerImageView.image = meal?.image
        titleLabel.text = meal?.title
        
        flagBadgeView.configure(with: String(meal!.price) + "€", font: UIFont.systemFont(ofSize: 20.0))
        flagBadgeView.addMealShadow()
        
        gradientView.setNeedsLayout()
        gradientView.layoutIfNeeded()
        gradientView.backgroundColor = .clear
        let gradientLayer: CAGradientLayer = CAGradientLayer()
        gradientLayer.frame.size = gradientView.frame.size
        gradientLayer.colors = [UIColor.clear.cgColor, UIColor.white.cgColor]
        gradientLayer.locations = [0.0, 1]
        gradientView.layer.addSublayer(gradientLayer)
    }
    
    @IBAction func respValidAction(_ sender: Any) {
        
    }
    
    @IBAction func dismissAction(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
}

extension MealDetailViewController: UITextFieldDelegate {
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
