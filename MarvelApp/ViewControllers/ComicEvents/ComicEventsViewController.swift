//
//  ComicEventsViewController.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 28/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class ComicEventsViewController: UITableViewController {
    
    let managerConnection = ManagerConnection()
    var comicsToDiscouse = [Comic]()
    
    
    var twoDimensionArray = [ExpandableComic]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.fetchEventData()
        self.navigationItem.title = "MARVEL CHALLENGE"
        self.initConfTable()
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        EventBus.listenWithData(target: self, event: .toggleDescriptionEvent) { (sectionIndex: Int?) in
            guard let sectionIndex = sectionIndex else { return }
            let data = self.twoDimensionArray[sectionIndex]
            data.toggle()
            if data.shouldFetchComicsToDiscouse, let fetchURL = data.comicEvent.comics?.collectionURI {
                self.fetchComicsToDiscouseData(endpoint: fetchURL, index: sectionIndex)
            } else {
                self.tableView.reloadSections([sectionIndex], with: .automatic)
            }
        }
    }
    
    private func fetchEventData() {
        ProgressHUD.show()
        managerConnection.getEvetsData() { events in
            ProgressHUD.dismiss()
            guard let events = events else {
                return
            }
            let eventsOrder = events.reversed()
            self.twoDimensionArray += eventsOrder.map { ExpandableComic(comicEvent: $0) }
            self.tableView.reloadData()
        }
    }
    
    private func fetchComicsToDiscouseData(endpoint: String, index: Int) {
        ProgressHUD.show()
        managerConnection.getDetails(endpoint: endpoint) { comicsToDiscouse in
            ProgressHUD.dismiss()
            if let comicsToDiscouse = comicsToDiscouse {
                self.twoDimensionArray[index].comicsToDiscouse += comicsToDiscouse
                self.tableView.reloadSections([index], with: .automatic)
            }
        }
    }
    
    private func initConfTable() {
        tableView.register(UINib(nibName: "CenterTitleCell", bundle: .main), forCellReuseIdentifier: CenterTitleCell.cellId)
        tableView.register(UINib(nibName: "TitleDateCell", bundle: .main), forCellReuseIdentifier: TitleDateCell.cellId)
        tableView.rowHeight = UITableView.automaticDimension
        tableView.estimatedRowHeight = 100
        tableView.backgroundColor = UIColor.backgroundColor()
    }
    
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        return twoDimensionArray.count
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return twoDimensionArray[section].cellsCount
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let comicData = twoDimensionArray[indexPath.section]
        let cellId = comicData.getCellID(index: indexPath.row)
        let cell = tableView.dequeueReusableCell(withIdentifier: cellId, for: indexPath)
        
        if let cell = cell as? ComicEventHeaderCell{
            cell.setComicEventData(expandibleComicEvent: comicData, index: indexPath.section)
            
        }
        if let cell = cell as? CenterTitleCell {
            self.set(cell, comicData: comicData)
        }
        if let cell = cell as? TitleDateCell {
            self.set(cell, comicToDiscouse: comicData.comicsToDiscouse[indexPath.row - 2])            
        }
        cell.selectionStyle = .none
        
        return cell
    }
    
    private func set(_ cell: CenterTitleCell, comicData: ExpandableComic){
        let title = comicData.comicsToDiscouse.isEmpty ? "NO HAY COMICS A DISCUTIR" : "COMICS A DISCUTIR"
        cell.setTitle(title: title)
    }
    private func set(_ cell: TitleDateCell, comicToDiscouse: Comic) {
        let title = comicToDiscouse.title ?? "SIN TITULO"
        let date = comicToDiscouse.dates?.first?.date
        cell.set(title: title, date: date)
    }
    
}
