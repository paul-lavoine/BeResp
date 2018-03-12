//
//  UIViewController.swift
//  BeResp
//
//  Created by Paul Lavoine on 12/03/2018.
//  Copyright © 2018 Paul Lavoine. All rights reserved.
//

import UIKit

extension UIViewController: UITextFieldDelegate {
    public func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
}
