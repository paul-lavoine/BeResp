//
//  MenuHeaderView.swift
//  BeResp
//
//  Created by Paul Lavoine on 03/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

class MenuHeaderView: UIView {
    @IBOutlet weak var userImageView: UIImageView!
    
    func configure(with image: UIImage) {
        userImageView.layer.cornerRadius = userImageView.frame.width / 2.0
        userImageView.image = image
    }
}
