//
//  CharacterDetail.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//


import Foundation

struct Character: Codable {
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
   
}

struct Characters: Codable {
    var results: [Character]?
}

struct CharactersData: Codable {
    var data: Characters?
}
