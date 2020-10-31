//
//  EventTitleCell.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 31/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class EventTitleCell: UITableViewCell {
    
   
    @IBOutlet weak var title: UILabel!
    private var comicEvent: ComicEvent!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
    }
    
    func set(expandibleComicEvent: ExpandableComic) {
        self.title.text = expandibleComicEvent.comicsToDiscouse.isEmpty ? "NO HAY COMICS A DISCUTIR" : "COMICS A DISCUTIR"
       }
}
