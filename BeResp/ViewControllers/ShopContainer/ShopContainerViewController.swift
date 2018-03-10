//
//  ShopContainerViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 07/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

protocol ShopDetailDelegate {
    func didSelect(meal: Meal)
}

class ShopContainerViewController: UIViewController {
    
    @IBOutlet weak var embeddedContainerView: UIView!
    
    @IBOutlet weak var tabsIndicatorView: UIView!
    @IBOutlet weak var firstTabButton: UIButton!
    @IBOutlet weak var secondTabButton: UIButton!
    @IBOutlet weak var thirdTabButton: UIButton!
    
    @IBOutlet weak var backButton: UIButton!
    
    // Data
    var shop: Shop?
    var currentDisplay: CurrentDisplay = .description
    
    fileprivate var shopDetailviewController: ShopDetailViewController?
    fileprivate var mealviewController: MealViewController?
    
    // Constraint
    @IBOutlet weak var tabsIndicatorLeadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        shopDetailviewController?.view.frame = embeddedContainerView.frame
        embeddedContainerView.addSubview((shopDetailviewController?.view)!)
    }
    
    func configure(with shop: Shop) {
        self.shop = shop
        
        shopDetailviewController = StoryboardManager.shopDetailViewController(shop: shop)
        mealviewController = StoryboardManager.mealViewController(shop: shop, delegate: self)
    }
    
    // Actions
    @IBAction func showDescription(_ sender: Any) {
        animeTabs(display: .description)
        backButton.tintColor = .white
        embeddedContainerView.addSubview((shopDetailviewController?.view)!)
    }
    
    @IBAction func showMenu(_ sender: Any) {
        animeTabs(display: .menu)
        backButton.tintColor = .black
        embeddedContainerView.addSubview((mealviewController?.view)!)
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

extension ShopContainerViewController: ShopDetailDelegate {
    func didSelect(meal: Meal) {
        self.navigationController?.present(StoryboardManager.mealDetailViewController(meal: meal), animated: true, completion: nil)
    }
}
