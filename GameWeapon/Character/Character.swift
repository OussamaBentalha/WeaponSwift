//
//  Character.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import Foundation


class Character: NSObject {
    var name:String;
    var health:Int;
    var hitChance:Int;
    var weapon: IWeapon;
    
    init(name: String, weapon: IWeapon, health: Int) {
        self.name = name;
        self.weapon = weapon;
        self.health = health > 25000 ? health : 25000;
        self.hitChance = Int(arc4random_uniform(70) + 50);
    }
    
    func protect(attack: Int) {
        self.health -= Int(Double(attack) * 0.55);
    }
    
    func attack(user: Character) {
        let damage = Double(self.weapon.damage()) * 1.13;
        let random = Int(arc4random_uniform(100) + 0);
        if random < self.hitChance {
            user.protect(Int(damage));
        }
    }
}