//
//  CenterTitleCell.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 31/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class CenterTitleCell: UITableViewCell {
    
    static let cellId = "CenterTitleCell"

     @IBOutlet weak var title: UILabel!

     override func awakeFromNib() {
         super.awakeFromNib()
         
         self.backgroundColor = .clear
         self.contentView.backgroundColor = .clear
     }
     
    func setTitle(title: String) {
         self.title.text = title
        }
    
}
