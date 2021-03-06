//
//  CharacterCell.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

class CharacterCell: UITableViewCell {
    
    @IBOutlet weak var characterImage: UIImageView!
    @IBOutlet weak var characterName: UILabel!
    @IBOutlet weak var characterDescription: UILabel!
    @IBOutlet weak var bgView: UIView!
    private var character: ComicCharacter!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear

        self.bgView.cornerRadius = 5

    }
    
    @IBAction private func showRuleDetail() {
        EventBus.post(event: .showCharacterDetail, data: character)
    }
    
    func setCharacterData(character: ComicCharacter) {
        self.characterName.text = character.name?.uppercased() ?? "no-name"
        self.characterDescription.text = character.description ?? "no-description"
        print()
        self.characterImage.sd_setImage(with: character.thumbnail?.url, placeholderImage: UIImage(named: "image_place_holder"))
        self.character = character
    }
}
