//
//  Excalibur.swift
//  GameWeapon
//
//  Created by Oussama Bentalha on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import Foundation

public class Excalibur: Sword{
    
    public override func bonus() -> Int {
        return (self.weight / self.year) * Int(1.30)
    }
}