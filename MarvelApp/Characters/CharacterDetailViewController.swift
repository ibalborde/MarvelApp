//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 31/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UITableViewController {
    
    var character = Character()
    let managerConnection = ManagerConnection()
    

    
    override func viewDidLoad() {
        super.viewDidLoad()
        //self.fetchEventData()
        tableView.register(UINib(nibName: "CenterTitleCell", bundle: .main), forCellReuseIdentifier: CenterTitleCell.cellId)
         tableView.register(UINib(nibName: "TitleDateCell", bundle: .main), forCellReuseIdentifier: TitleDateCell.cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = UIColor.backgroundColor()
    }
    
//    private func fetchComicsToDiscouseData(endpoint: String, index: Int) {
//        ProgressHUD.show()
//        managerConnection.getEvetsToDiscouse(endpoint: endpoint) { comicsToDiscouse in
//            ProgressHUD.dismiss()
//            if let comicsToDiscouse = comicsToDiscouse {
//                self.twoDimensionArray[index].comicsToDiscouse += comicsToDiscouse
//                self.tableView.reloadSections([index], with: .automatic)
//            }
//        }
//    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func prenset(from parentViewController: UIViewController, character: Character) {
        guard let storyBoard = parentViewController.storyboard else { return }
        let viewController = storyBoard.instantiateViewController(withIdentifier: "CharacterDetailViewControllerNav")
        viewController.modalPresentationStyle = .fullScreen
        
        guard
            let navController = viewController as? UINavigationController,
            let characterDatailViewController = navController.viewControllers.first as? CharacterDetailViewController
            else { return }
            characterDatailViewController.character = character
            parentViewController.present(navController, animated: true, completion: nil)
    }
}
