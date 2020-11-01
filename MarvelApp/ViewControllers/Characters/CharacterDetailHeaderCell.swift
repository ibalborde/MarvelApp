//
//  CharacterDetailHeaderCell.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 31/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class CharacterDetailHeaderCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterDescription: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear
        //self.bgView.cornerRadius = 3
    }
    
    func setComicData(character: ComicCharacter) {
        self.characterDescription.text = character.description ?? "SIN DESCRIPCIÓN"
        self.characterImage.sd_setImage(with: character.thumbnail?.urlLarge, placeholderImage: UIImage(named: "image_place_holder"))
        
    }
}


