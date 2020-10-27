//
//  CharactersViewController.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit
import Alamofire

class CharactersViewController: UIViewController {
    
    @IBOutlet private weak var tableView: UITableView!
    let dataSouce = CharactersViewControllerDataSource()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        dataSouce.tableView = tableView
        tableView.backgroundColor = UIColor.backgroundColor()
        self.fetchCharactersData()
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
    
    func fetchCharactersData() {
           
           let endpoint: String = "\(ConstantsAPI.getCharacters)\(ConstantsMarvel.hashMarvel)"
           
           AF.request(endpoint, method: .get, encoding: JSONEncoding.default)
               .responseJSON { response in
                   debugPrint(response)
                   
                   guard let characters = response.value else { return }
                   //self.items = characters.all
                   //self.tableView.reloadData()
           }
       }
}

class CharactersViewControllerDataSource: NSObject {
    weak var tableView: UITableView! {
        didSet {
            tableView.dataSource = self
            tableView.delegate = self
        }
    }
}

extension CharactersViewControllerDataSource: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Character", for: indexPath)
        if let cell = cell as? CharacterCell {
            //cell.setData(rule: CurrenRules[indexPath.row])
            cell.setCharacterData()
        }
        return cell
    }
}

extension CharactersViewControllerDataSource: UITableViewDelegate {
    
}
