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
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.isHidden = true
        
        let fontSize = CGFloat(45.0)
        let attrString = NSMutableAttributedString(string: "be",
                                                   attributes: [ NSAttributedStringKey.font: UIFont.init(name: "MyriadPro-Light", size: fontSize)!])
        
        attrString.append(NSMutableAttributedString(string: "resp",
                                                    attributes: [NSAttributedStringKey.font: UIFont.init(name: "MyriadPro-Bold", size: fontSize)!]))
        
        titleLabel.attributedText = attrString
        
        addTextFielBorderBottom(with: emailTextField, color: .lightGray)
        addTextFielBorderBottom(with: passwordTextField, color: .lightGray)
        
        let controller = UIStoryboard(name: "Main", bundle: nil).instantiateViewController(withIdentifier: "HomeViewController")
        self.navigationController?.present(controller, animated: true, completion: nil)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
    }

    @IBAction func connectUser(_ sender: Any) {
        pushProfileViewController()
    }
    
    func pushProfileViewController() {
        let navigationController = NavigationController(rootViewController: StoryboardManager.profileViewController())
        
        let mainViewController = MainViewController()
        mainViewController.rootViewController = navigationController
        mainViewController.setup(type: 0)
        
        self.navigationController?.pushViewController(mainViewController, animated: true)
//        let window = UIApplication.shared.delegate!.window!!
//        window.rootViewController = mainViewController
        
//        UIView.transition(with: window, duration: 0.3, options: [.transitionCrossDissolve], animations: nil, completion: nil)
    }
    
    func addTextFielBorderBottom(with textField: UITextField, color: UIColor) {
        textField.setNeedsLayout()
        textField.layoutIfNeeded()
        
        let borderWidth = CGFloat(1.0)
        let border = CALayer()
        border.borderColor = color.cgColor
        border.frame = CGRect(x: 0,
                              y: textField.frame.height - borderWidth,
                              width: textField.frame.width,
                              height: textField.frame.height)
        border.borderWidth = borderWidth
        textField.layer.addSublayer(border)
        textField.layer.masksToBounds = true
    }

    @IBAction func toggleCharacterPassword(_ sender: Any) {
        passwordTextField.isSecureTextEntry = !passwordTextField.isSecureTextEntry
    }
}

