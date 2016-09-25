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

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if characters == nil {
            self.characters = [];
        }
        
        self.title = "Characters";
        
        let addButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(CharacterListViewController.addCharacter));
        self.navigationItem.rightBarButtonItems = [addButton];
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
}
