//
//  ComicEventsViewController.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 28/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class ComicEventsViewController: UITableViewController {
    
    var comicEvent = [ComicEvent]()

    
    let cellId = "cellId123123"
    
    let names = [
        "Amy", "Bill", "Amy2", "Bill2",  "Amy3", "Bill3"
    ]
    let cNames = [
        "cAmy", "cBill", "cAmy2", "cBill2",  "cAmy3", "cBill3"
    ]
    let dNames = [
        "dAmy", "dBill", "dAmy2", "dBill2",  "dAmy3", "dBill3"
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell", for: indexPath)
//        if let cell = cell as? ComicEventCell {
//                  cell.setComicEventData(comicEvent: comicEvent[indexPath.row])
//              }
         return cell
    }
}
