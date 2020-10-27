//
//  CharactersViewController.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class CharactersViewController: UIViewController {
        
    @IBOutlet private weak var tableView: UITableView!
    var characters = [CharacterData]()
    let managerConnection = ManagerConnection()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //dataSouce.tableView = tableView
        tableView.dataSource = self
        tableView.delegate = self
        tableView.backgroundColor = UIColor.backgroundColor()
        managerConnection.getCharactersData() { characters in
            if characters != nil {
                self.characters = characters!
                self.tableView.reloadData()
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
//        EventBus.listenWithData(target: self, event: .showCharacterDetail) { (character: CharacterData?) in
//            guard let character = character else { return }
//            self.performSegue(withIdentifier: "CharacterDetail", sender: character)
//        }
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super .viewWillDisappear(animated)
        
        EventBus.stopListening(target: self)
    }
    
    //        override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //            guard
    //                let destination = segue.destination as? RuleDetailsViewController,
    //                let rule = sender as? RuleData else { return }
    //            destination.rule = rule
    //        }
    
}

//class CharactersViewControllerDataSource: NSObject {
//    weak var tableView: UITableView! {
//        didSet {
//            tableView.dataSource = self
//            tableView.delegate = self
//        }
//    }
//}

extension CharactersViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Character", for: indexPath)
        if let cell = cell as? CharacterCell {
            cell.setCharacterData(character: characters[indexPath.row])
            //cell.setCharacterData()
        }
        return cell
    }
}

extension CharactersViewController: UITableViewDelegate {
    
}
