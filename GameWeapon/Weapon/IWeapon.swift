//
//  IWeapon.swift
//  GameWeapon
//
//  Created by Oussama Bentalha on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import Foundation

public protocol IWeapon{
    
    var name: String {get set};
    var height: Int {get set};
    var width: Int {get set};
    var weight: Int {get set};
    var price: Float {get set};
    
    func duration() -> Int;
    
    func damage() -> Int;
    
    func bonus() -> Int;
    
}