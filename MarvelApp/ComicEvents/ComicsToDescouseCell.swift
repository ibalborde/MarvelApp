//
//  ComicsToDescouseCell.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 30/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class ComicsToDescouseCell: UITableViewCell {
    
   
    @IBOutlet weak var title: UILabel!
    @IBOutlet weak var dateTitle: UILabel!
    //@IBOutlet weak var bgView: UIView!
    private var comicEvent: ComicEvent!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        //self.bgView.cornerRadius = 3
    }
    
//    @IBAction private func showRuleDetail() {
//        EventBus.post(event: .showCharacterDetail, data: character)
//    }

    
    func set(comicToDescouse: ComicToDiscouse) {
        self.title.text = comicToDescouse.title
        self.dateTitle.text = "fechita"
    }
}
