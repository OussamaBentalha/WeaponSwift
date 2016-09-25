//
//  CharacterListViewController.swift
//  GameWeapon
//
//  Created by Nicolas Fonsat on 13/09/2016.
//  Copyright © 2016 Oussama Bentalha. All rights reserved.
//

import UIKit

class CharacterListViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {

    @IBOutlet weak var charactersTableView: UITableView!
    
    var characters:[Character]!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if characters == nil {
            self.characters = [];
        }
        
        self.title = "Characters";
        
        if let navigationController = self.navigationController {
            if let topItem = navigationController.navigationBar.topItem {
                let backButton: UIBarButtonItem = UIBarButtonItem();
                backButton.title = "";
                topItem.backBarButtonItem = backButton;
            }
        }
        
        let addButton:UIBarButtonItem = UIBarButtonItem(barButtonSystemItem: .Add, target: self, action: #selector(CharacterListViewController.addCharacter));
        self.navigationItem.rightBarButtonItems = [addButton];
    }
    
    func addCharacter() -> Void {
        print("addCharacter -- +++\n");
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
