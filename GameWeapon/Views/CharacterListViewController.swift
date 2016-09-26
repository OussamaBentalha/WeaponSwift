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
    
    let cellId:String = "CharacterCell"
    
    var characters:[Character]!
    
    var characterManager: CharacterManager!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.characterManager = CharacterManager.SharedManager;
        
        if characters == nil {
            self.characters = [];
        }
        
        self.title = "Characters";
        
        let addButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(CharacterListViewController.addCharacter));
        self.navigationItem.rightBarButtonItems = [addButton];
        
        self.initTableView();
    }
    
    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated);
        self.characters = self.characterManager.characters;
        self.charactersTableView.reloadData();
    }
    
    func addCharacter() -> Void {
        let formView:CharacterFormViewController = CharacterFormViewController();
        self.navigationController?.pushViewController(formView, animated: true);
    }
    
    func initTableView() -> Void {
        let nib:UINib = UINib(nibName: "CharacterTableViewCell", bundle: nil);
        self.charactersTableView.registerNib(nib, forCellReuseIdentifier: cellId);
        
        self.charactersTableView.dataSource = self;
        self.charactersTableView.delegate   = self;
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.characters.count;
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell:CharacterTableViewCell = tableView.dequeueReusableCellWithIdentifier(cellId) as! CharacterTableViewCell;
        
        let character = self.characters[indexPath.row];
        
        cell.textLabel!.text = character.name;
        
        return cell;
    }
}
