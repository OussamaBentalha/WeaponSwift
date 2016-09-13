//
//  Sword.swift
//  GameWeapon
//
//  Created by Oussama Bentalha on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import Foundation

public class Sword : NSObject, IWeapon{
    
    public var name: String;
    public var height: Int;
    public var width: Int;
    public var weight: Int;
    public var price: Float;
    
    var legendary: Bool;
    var year: Int;

    
    init(name: String, height: Int, width: Int, weight: Int, price: Float, legendary: Bool, year: Int) {
        self.name = name;
        self.height = height;
        self.width = width;
        self.weight = weight;
        self.price = price;
        self.legendary = legendary;
        self.year = year;
    }
    
    public func duration() -> Int {
        return (self.weight * self.year) / Int(self.price);
    }
    
    public func damage() -> Int {
        var puissance = ( (self.weight * self.height * self.width + bonus()) / self.year );
        if(!self.legendary || self.year < 10){
            puissance *= Int(0.9);
        }
        return puissance;
    }
    
    public func bonus() -> Int {
        if(self.legendary){
            self.weight / self.year;
        }
        return 0;
    }
    
    
    
}