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
    var thumbnailUrl: URL? {
        guard let thumbnail = self.thumbnail,
        let path = thumbnail.path,
        let imageExtension = thumbnail.imageExtension else { return nil }
        return URL(string: "\(path)/standard_medium.\(imageExtension)")
    }
}

struct Thumbnail: Codable {
    var path: String?
    var imageExtension: String?
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}

struct Characters: Codable {
    var results: [CharacterData]?
}

struct Data: Codable {
    var data: Characters?
}
