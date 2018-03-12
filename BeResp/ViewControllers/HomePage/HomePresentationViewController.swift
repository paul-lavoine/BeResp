//
//  HomePresentationViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 11/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class HomePresentationViewController: UIViewController {
    
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var subtitleLabel: UILabel!
    @IBOutlet weak var cationLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let fontSize = CGFloat(45.0)
        let attrString = NSMutableAttributedString(string: "be",
                                                   attributes: [ NSAttributedStringKey.font: UIFont.init(name: "MyriadPro-Light", size: fontSize)!])
        
        attrString.append(NSMutableAttributedString(string: "resp",
                                                    attributes: [NSAttributedStringKey.font: UIFont.init(name: "MyriadPro-Bold", size: fontSize)!]))
        
        titleLabel.attributedText = attrString
    }
}
