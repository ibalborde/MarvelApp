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
    
    //private var rule: RuleData!

    override func awakeFromNib() {
        super.awakeFromNib()
        
        self.backgroundColor = .clear
        self.contentView.backgroundColor = .clear

        self.characterDescription.textColor = .darkGray
        self.bgView.cornerRadius = 3

    }
    
    @IBAction private func showRuleDetail() {
        EventBus.post(event: .showCharacterDetail, data: nil)
    }
    
    func setCharacterData() {
        self.characterName.text = "nombre"
        self.characterDescription.text = "descripcion"
    }
    
//    func setData(rule: RuleData) {
//        self.titleLabel.text = rule.title
//        self.ruleNumerLabel.text = rule.number
//        self.ruleDescriptionLabel.text = rule.description
//        self.rule = rule
//    }
}
