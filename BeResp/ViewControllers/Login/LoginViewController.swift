//
//  ViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 24/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let attrString = NSMutableAttributedString(string: "be", attributes: [ NSAttributedStringKey.font: UIFont.systemFont(ofSize: 35) ])
        attrString.append(NSMutableAttributedString(string: "resp", attributes: [NSAttributedStringKey.font: UIFont.boldSystemFont(ofSize: 35)]))
        titleLabel.attributedText = attrString
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
        self.navigationController?.present(controller, animated: true, completion: nil)
        
//        pushProfileViewController()
    }

    @IBAction func connectUser(_ sender: Any) {
        pushProfileViewController()
    }
    
    func pushProfileViewController() {
        let navigationController = NavigationController(rootViewController: StoryboardManager.profileViewController())
        
        let mainViewController = MainViewController()
        mainViewController.rootViewController = navigationController
        mainViewController.setup(type: 0)
        
        let window = UIApplication.shared.delegate!.window!!
        window.rootViewController = mainViewController
        
        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
    }
}

