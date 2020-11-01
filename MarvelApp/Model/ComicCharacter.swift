//
//  CharacterDetail.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//


import Foundation

struct ComicCharacter: Codable {
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
    var comics: ComicURI?
}

struct Characters: Codable {
    var results: [ComicCharacter]?
}

struct CharactersData: Codable {
    var data: Characters?
}
