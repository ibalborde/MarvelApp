//
//  CharacterDetailViewController.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 31/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class CharacterDetailViewController: UITableViewController {
    
    var character: ComicCharacter!
    let managerConnection = ManagerConnection()
    var comics = [Comic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.fetchComicData()
        self.initConfTable()
        self.navigationItem.title = character.name?.uppercased()
        
    }
    
    @IBAction func dismiss(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
    }
    
    static func prenset(from parentViewController: UIViewController, character: ComicCharacter) {
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
    
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return comics.count + 2
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cellId = self.getCellID(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? CharacterDetailHeaderCell{
            cell.setComicData(character: character)
            
        }
        if let cell = cell as? CenterTitleCell {
            cell.setTitle(title: "COMICS EN LOS QUE APARECE")
        }
        if let cell = cell as? TitleDateCell {
            self.set(cell, comicData: comics[indexPath.row - 2])
        }
        
        return cell
    }
    
    private func fetchComicData() {
        
        let endpoint = (character.comics?.collectionURI)!
        
        ProgressHUD.show()
        managerConnection.getDetails(endpoint: endpoint) { comicsToAppear in
            ProgressHUD.dismiss()
            if let comicsToAppear = comicsToAppear {
                self.comics += comicsToAppear
                self.tableView.reloadData()
            }
        }
    }
    
    private func initConfTable(){
        tableView.register(UINib(nibName: "CenterTitleCell", bundle: .main), forCellReuseIdentifier: CenterTitleCell.cellId)
        tableView.register(UINib(nibName: "TitleDateCell", bundle: .main), forCellReuseIdentifier: TitleDateCell.cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
    }
    
    private func getCellID(index: Int) -> String{
        if index == 0 {
            return "cellHeader"
        } else if index == 1 {
            return CenterTitleCell.cellId
        } else {
            return TitleDateCell.cellId
        }
    }
    
    private func set(_ cell: TitleDateCell, comicData: Comic) {
        let title = comicData.title ?? "SIN TITULO"
        let date = comicData.dates?.first?.date
        cell.set(title: title, date: date)
    }
}
