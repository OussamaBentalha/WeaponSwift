//
//  CharacterListViewController.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import UIKit

class CharacterListViewController: GWDefaultViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var charactersTableView: UITableView!
    
    var characters:[Character]!
    
    var characterManager: CharacterManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterManager = CharacterManager.SharedManager;
        
        if characters == nil {
            let gun:Gun = Gun(name: "Gun", height: 12, width: 12, weight: 90, price: 100, bullets: 888);
            let mario:Character = Character(name: "Mario", weapon: gun, health: 90000);
            self.characters = [mario];
        }
        
        self.title = "Characters";
        
        let addButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(CharacterListViewController.addCharacter));
        self.navigationItem.rightBarButtonItems = [addButton];
        
        self.initTableView();
    }
    
    func addCharacter() -> Void {
        let formView:CharacterFormViewController = CharacterFormViewController();
        self.navigationController?.pushViewController(formView, animated: true);
    }
    
    func initTableView() -> Void {
        self.charactersTableView.dataSource = self;
        self.charactersTableView.delegate   = self;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        return UITableViewCell();
    }
    
    func didReloadCharacterTable() {
        self.characters = self.characterManager.characters;
        dispatch_async(dispatch_get_main_queue(), { () -> Void in
            self.charactersTableView.reloadData();
        })
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.characters = self.characterManager.characters;
        self.charactersTableView.reloadData();
    }
    
}
