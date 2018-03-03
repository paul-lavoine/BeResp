//
//  ProfileViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 24/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController, UIGestureRecognizerDelegate {
    
    @IBOutlet weak var searchContainerView: UIView!
    @IBOutlet weak var nearestShopContainerView: ShopCell!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUI()
    }
    
    func configureUI() {
        self.navigationController?.navigationBar.isHidden = true
        
        searchContainerView.layer.cornerRadius = 5.0
        let shadowPath = UIBezierPath(rect: searchContainerView.bounds)
        searchContainerView.layer.masksToBounds = false
        searchContainerView.layer.shadowColor = UIColor.black.cgColor
        searchContainerView.layer.shadowOffset = CGSize(width: 10.0, height: 10.0)
        searchContainerView.layer.shadowRadius = 10.0
        searchContainerView.layer.shadowOpacity = 0.5
        searchContainerView.layer.shadowPath = shadowPath.cgPath
        
        let shop: ShopCell = ShopCell.instanceFromNib()
        shop.frame = CGRect(x: 3, y: 0, width: self.view.frame.size.width - 7, height: ShopCell.heightCell)
        shop.configure(with: ShopsController.shared.nearestShop())
        nearestShopContainerView.addSubview(shop)
    }
    
    @IBAction func searchAction(_ sender: Any) {
        
    }

    @IBAction func commercesAction(_ sender: Any) {
        self.navigationController?.pushViewController(StoryboardManager.shopsViewController(), animated: true)
    }
    
    @IBAction func calendarAction(_ sender: Any) {
    }
    
    @IBAction func organisationsAction(_ sender: Any) {
    }
}
