//
//  RootViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 24/02/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit
import LGSideMenuController

class RootViewController: UIViewController {
    
    @IBOutlet weak var sideMenuViewController: LGSideMenuController!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .green
        
    }
}
