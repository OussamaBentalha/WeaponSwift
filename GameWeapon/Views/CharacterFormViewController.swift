//
//  CharacterFormViewController.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import UIKit

class CharacterFormViewController: GWDefaultViewController, WeaponDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "New Character"
    }
    
    // MARK: - Weapon

    @IBAction func chooseWeapon(sender: UIButton) {
        let weaponView:WeaponListViewController = WeaponListViewController();
        weaponView.delegate = self;
        self.navigationController?.pushViewController(weaponView, animated: true);
    }
    
    func didChooseWeapon(weapon:IWeapon) -> Void {
        print("Choose weapon : " + weapon.name);
    }
    

    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        print("CharacterFormViewController -- prepareForSegue");
    }

}
