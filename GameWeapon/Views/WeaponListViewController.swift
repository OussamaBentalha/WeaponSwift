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

class WeaponListViewController: GWDefaultViewController, UITableViewDelegate, UITableViewDataSource {
    
    let cellId:String = "WeaponCell";
    
    var delegate:WeaponDelegate?;
    
    var weapons:[String] = [];

    @IBOutlet weak var weaponTableView: UITableView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.title   = "Weapons";
        
        self.weapons = self.getWeapons();
        
        self.initTableView();
    }
    
    // MARK: - Weapons
    
    func getWeapons() -> [String] {
        var weapons:[String] = [];
        
        weapons.append("Escalibur");
        
        weapons.append("Gun");
        
        weapons.append("Sword");
        
        return weapons;
    }
    
    // MARK: - Weapons TableView
    
    func initTableView() -> Void {
        let nib:UINib = UINib(nibName: "WeaponTableViewCell", bundle: nil);
        self.weaponTableView.registerNib(nib, forCellReuseIdentifier: cellId);
        
        self.weaponTableView.dataSource = self;
        self.weaponTableView.delegate   = self;
    }
    
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.weapons.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:WeaponTableViewCell = tableView.dequeueReusableCellWithIdentifier("WeaponCell") as! WeaponTableViewCell;
        
        let weapon = weapons[indexPath.row];
        
        cell.title.text = weapon;
        
        return cell;
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
        let weaponStr = weapons[indexPath.row];
        var weapon:IWeapon;
        
        
        switch weaponStr {
        case "Escalibur":
            weapon = Excalibur(name: "Excalibur", height: 5, width: 33, weight: 125, price: 250, legendary: true, year: 1999);
            break;
            
        case "Sword":
            weapon = Sword(name: "Sword", height: 10, width: 20, weight: 100, price: 45, legendary: true, year: 1900)
            break;

        default:
            weapon = Gun(name: "Gun", height: 12, width: 12, weight: 90, price: 100, bullets: 888);
        }
        
        if delegate != nil {
            delegate?.didChooseWeapon(weapon);
        }
        
        self.navigationController?.popViewControllerAnimated(true);
    }
}
