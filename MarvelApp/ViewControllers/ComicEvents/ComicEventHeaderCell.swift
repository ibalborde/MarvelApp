//
//  ComicEventCell.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 28/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class ComicEventHeaderCell: UITableViewCell {
    
    @IBOutlet weak var comicEventImage: UIImageView!
    @IBOutlet weak var comicEventTitle: UILabel!
    @IBOutlet weak var comicEventDateStart: UILabel!
    @IBOutlet weak var comicEventDateEnd: UILabel!
    @IBOutlet weak var arrowButton: UIButton!
    @IBOutlet weak var bgView: UIView!
    
    
    var sectionIndex: Int!
    private var comicEvent: ComicEvent!
    var isOn:Bool = false
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        self.bgView.cornerRadius = 5
        self.comicEventImage.round(with: .left, radius: 5)
    }
    
    @IBAction private func toggleDescription() {
        EventBus.post(event: .toggleDescriptionEvent, data: sectionIndex)
    }
    
    
    func setComicEventData(expandibleComicEvent: ExpandableComic, index: Int) {
        let comicEvent = expandibleComicEvent.comicEvent
        self.comicEventTitle.text = comicEvent.title ?? "no-name"
        self.comicEventDateStart.text = getDate(date: comicEvent.start)
        self.comicEventDateEnd.text = getDate(date: comicEvent.end)
        self.comicEventImage.sd_setImage(with: comicEvent.thumbnail?.url, placeholderImage: UIImage(named: "image_place_holder"))
        self.comicEvent = comicEvent
        self.sectionIndex = index
        self.setButtonImage(isOn: expandibleComicEvent.isExpanded)
    }
    
    private func getDate(date: String?) -> String{
        if date != nil {
            let dateFormatter = DateFormatter(format: "yyyy-MM-dd HH:mm:ss")
            return date!.toDateHeaderString(dateFormatter: dateFormatter)!
        }
        return "SIN FECHA"
    }
    
    private func setButtonImage(isOn: Bool) {
        let nameImage = isOn ? "arrow-up" : "arrow-down"
        arrowButton.setImage(UIImage(named: nameImage), for: .normal)
    }
}



