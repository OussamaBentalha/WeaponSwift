//
//  WeaponListViewController.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import UIKit

protocol WeaponDelegate : NSObjectProtocol {
    func didChooseWeapon(weapon:IWeapon) -> Void;
}

class WeaponListViewController: GWDefaultViewController {
    
    var delegate:WeaponDelegate?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title = "Weapons";
    }

}
