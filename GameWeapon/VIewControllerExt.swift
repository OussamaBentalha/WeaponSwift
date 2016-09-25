//
//  VIewControllerExt.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 25/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import UIKit

extension UIViewController {
    func hideKeyboardWhenTappedAround() {
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
        view.addGestureRecognizer(tap)
    }
    
    func dismissKeyboard() {
        view.endEditing(true)
    }
}