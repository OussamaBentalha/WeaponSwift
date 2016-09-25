//
//  GWDefaultViewController.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 25/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import UIKit

class GWDefaultViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if let navigationController = self.navigationController {
            if let topItem = navigationController.navigationBar.topItem {
                let backButton: UIBarButtonItem = UIBarButtonItem();
                backButton.title = "";
                topItem.backBarButtonItem = backButton;
            }
        }
    }
}
