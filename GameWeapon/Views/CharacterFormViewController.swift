//
//  CharacterFormViewController.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import UIKit

class CharacterFormViewController: GWDefaultViewController, WeaponDelegate {
    
    
    @IBOutlet weak var nameField: UITextField!
    
    @IBOutlet weak var weaponBtn: UIButton!
    
    @IBOutlet weak var healthSlider: UISlider!
    @IBOutlet weak var healthValue: UILabel!
    
    var characterManager: CharacterManager!
    
    var weapon:IWeapon?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.hideKeyboardWhenTappedAround()

        self.title = "New Character";
        
        self.setValueSender(10000);
        
        self.characterManager = CharacterManager.SharedManager;
    }
    
    override func viewWillAppear(animated: Bool) {
        self.updateWeaponBtn();
    }
    
    // MARK: - Weapon

    @IBAction func chooseWeapon(sender: UIButton) {
        let weaponView:WeaponListViewController = WeaponListViewController();
        weaponView.delegate = self;
        self.navigationController?.pushViewController(weaponView, animated: true);
    }
    
    @IBAction func healthChanged(sender: UISlider) {
        let rounded: Int = Int(sender.value);
        self.setValueSender(rounded);
    }
    
    func setValueSender(value: Int) -> Void {
        self.healthSlider.setValue(Float(value), animated: false);
        self.healthValue.text = String(value);
    }
    
    func updateWeaponBtn() -> Void {
        let title:String = (weapon == nil) ?
            "Choose your weapon." : "Weapon : " + (self.weapon?.name)!;
        self.weaponBtn.setTitle(title, forState: .Normal);
    }
    
    func didChooseWeapon(weapon:IWeapon) -> Void {
        self.weapon = weapon;
    }
    
    // MARK: - Weapon
    
    @IBAction func submit(sender: UIButton) {
        let health: Int = Int(self.healthSlider.value);
        
        if self.nameField.text == nil {
            print("You need specify a name");
            return;
        }
        
        if self.weapon == nil {
            print("You need specify a weapon");
            return;
        }
        
        let character:Character = Character(name: self.nameField.text!, weapon: self.weapon!, health: health);
        
        if !self.characterManager.exist(character) {
            print("This name already exist");
            return;
        }
        
        self.characterManager.add(character);
        self.navigationController?.popViewControllerAnimated(true);
    }
}
