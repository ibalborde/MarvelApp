//
//  ComicEventCell.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 28/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class ComicEventCell: UITableViewCell {
    
    @IBOutlet weak var comicEventImage: UIImageView!
    @IBOutlet weak var comicEventTitle: UILabel!
    @IBOutlet weak var comicEventDateStart: UILabel!
    @IBOutlet weak var comicEventDateEnd: UILabel!
    var sectionIndex: Int!
    //@IBOutlet weak var bgView: UIView!
    private var comicEvent: ComicEvent!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        //self.bgView.cornerRadius = 3
    }
    
    @IBAction private func toggleDescription() {
        EventBus.post(event: .toggleDescriptionEvent, data: sectionIndex)
    }

    
    func setComicEventData(expandibleComicEvent: ExpandableComic, index: Int) {
        let comicEvent = expandibleComicEvent.comicEvent
        self.comicEventTitle.text = comicEvent.title ?? "no-name"
        self.comicEventDateStart.text = comicEvent.start ?? "no-description"
        self.comicEventDateEnd.text = comicEvent.end ?? "no-description"
        self.comicEventImage.sd_setImage(with: comicEvent.thumbnail?.url, placeholderImage: UIImage(named: "image_place_holder"))
        self.comicEvent = comicEvent
        self.sectionIndex = index
    }
}
