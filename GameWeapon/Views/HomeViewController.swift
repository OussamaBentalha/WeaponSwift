//
//  ViewController.swift
//  GameWeapon
//
//  Created by Oussama Bentalha on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let excalibur:Excalibur = Excalibur(name: "Excalibur", height: 5, width: 33, weight: 125, price: 250, legendary: true, year: 1999);
        
        
        let gun:Gun = Gun(name: "Gun", height: 12, width: 12, weight: 90, price: 100, bullets: 888);
        
        let mario:Character = Character(name: "Mario", weapon: gun, health: 90000);
        let luigi:Character = Character(name: "Luigi", weapon: excalibur, health: 90000);
        
        mario.attack(luigi);
        luigi.attack(mario)
    }
}

