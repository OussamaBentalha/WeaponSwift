//
//  CharacterManager.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 25/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import Foundation

class CharacterManager: NSObject {
    
    class var SharedManager: CharacterManager {
        struct Singleton {
            static let instance = CharacterManager()
        }
        
        return Singleton.instance
    }
    
    var characters:[Character] = [];
    
    var first_player:Character! = nil;
    var second_player:Character! = nil;
    
    
    func add(character:Character) -> Void {
        self.characters.append(character);
    }
    
    func remove(character:Character) -> Void {
        let index = self.search(character);
        if index >= 0 {
            self.characters.removeAtIndex(index);
        }
    }
    
    func exist(character:Character) -> Bool {
        return self.search(character) >= 0;
    }
    
    func search(characterToSearch:Character) -> Int {
        var index = -1;
        
        var i = 0;
        while i < self.characters.count {
            let character:Character = self.characters[i];
            if characterToSearch.name == character.name {
                index = i;
                break;
            }
            
            i+=1;
        }
        
        return index;
    }
    
    func setFirstPlayer(character:Character) -> Void {
        self.first_player = character;
    }
    
    func setSecondPlayer(character:Character) -> Void {
        self.second_player = character;
    }
}