//
//  Gun.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import Foundation

class Gun: NSObject, IWeapon {
    var name: String;
    var height: Int;
    var width: Int;
    var weight: Int;
    var price: Float;
    
    var bullets:Int;
    
    init(name: String, height: Int, width: Int, weight: Int, price: Float, bullets: Int) {
        self.bullets = bullets;
        self.name = name;
        self.height = height;
        self.width = width;
        self.weight = weight;
        self.price = price;
    }
    
    func duration() -> Int {
        return (Int(self.price) / self.weight) * self.damage();
    }
    
    func damage() -> Int {
        return (self.weight / (self.height * self.width)) + self.bonus();
    }
    
    func bonus() -> Int {
        return (self.bullets * self.weight) / (self.weight % self.bullets);
    }
}