//
//  CharacterDetail.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//


import Foundation

struct CharacterData: Codable {
    var name: String?
    var description: String?
    var thumbnail: Thumbnail?
}

struct Thumbnail: Codable {
    var path: String?
    var extensionImage: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case extensionImage = "extension"
    }
}

struct Characters: Codable {
    var results: [CharacterData]?
}

struct Data: Codable {
    var data: Characters?
}
