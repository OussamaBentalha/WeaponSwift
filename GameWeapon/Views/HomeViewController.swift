//
//  ViewController.swift
//  GameWeapon
//
//  Created by Oussama Bentalha on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import UIKit

class HomeViewController: GWDefaultViewController {
    
    var characterManager: CharacterManager!
    
    var characters: [Character]!;
    
    @IBOutlet weak var labelResult: UILabel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterManager = CharacterManager.SharedManager;
        
        /*let excalibur:Excalibur = Excalibur(name: "Excalibur", height: 5, width: 33, weight: 125, price: 250, legendary: true, year: 1999);
        
        
        let gun:Gun = Gun(name: "Gun", height: 12, width: 12, weight: 90, price: 100, bullets: 888);
        
        let mario:Character = Character(name: "Mario", weapon: gun, health: 90000);
        let luigi:Character = Character(name: "Luigi", weapon: excalibur, health: 90000);
        
        mario.attack(luigi);
        luigi.attack(mario)*/
    }
    
    override func viewWillAppear(animated: Bool) {
        self.characters = characterManager.characters;
    }
    
    @IBAction func chooseCharacter(sender: UIButton) {
        let viewController: CharacterListViewController = CharacterListViewController();
        self.navigationController?.pushViewController(viewController, animated: true);
    }
    
    @IBAction func fight(sender: UIButton) {
        if(characterManager.characters.count <= 0){
            labelResult.text = "Aucun joueur pour combattre";
        } else if(characterManager.characters.count == 1){
            labelResult.text = "Ajouter un joueur pour combattre";
        } else {
            fight();
        }
    }
    
    func fight() -> Void {
        let counter = characters.count;
        
        while self.isFinish() {
            for i in 0...counter {
                for j in 0...counter {
                    if(i != j){
                        characters[i].attack(characters[j]);
                    }
                }
            }
        }
        
        var healthMax = 0;
        var gagnant:Character!;
        for i in 0...counter-1 {
            if(healthMax < characters[i].health){
                healthMax = characters[i].health;
                gagnant = characters[i];
            }
        }
        
        self.labelResult.text = "Gagnant : " + gagnant.name;
    }
    
    func isFinish() -> Bool {
        let semi = characters.count/2;
        var count = 0;
        
        for character in characters {
            if character.health <= 0 {
                count += 1;
                if count >= semi {
                    break;
                }
            }
        }
        
        return count >= semi;
    }
    
}

