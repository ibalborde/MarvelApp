//
//  TitleDateCell.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 31/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class TitleDateCell: UITableViewCell {
    
    static let cellId = "TitleDateCell"

    
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
    
    
    func set(title: String, date: String?) {
        self.title.text = title
        self.dateTitle.text = getDate(date)
    }
    
    private func getDate(_ date: String?) -> String{
        if date != nil {
            let dateFormatter = DateFormatter(format: "yyyy-MM-dd'T'HH:mm:ss-SSSS")
            return date!.toDateTitleString(dateFormatter: dateFormatter)!
        }
        return "no-date"
    }
    
}
