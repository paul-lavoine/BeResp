//
//  ProfileViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 24/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class ProfileViewController: UIViewController {
    
    @IBOutlet weak var searchContainerView: UIView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        configureUI()
    }
    
    override func viewDidDisappear(_ animated: Bool) {
        self.navigationController?.navigationBar.isHidden = false
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
    }
    
    @IBAction func searchAction(_ sender: Any) {
    }
}
