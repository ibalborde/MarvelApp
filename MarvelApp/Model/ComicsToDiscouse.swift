//
//  ComicsToDiscouse.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 30/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import Foundation

struct ComicToDiscouse: Codable {
    var title: String?
    var dates: [ComicDate]?
}

struct ComicsToDiscouse: Codable {
    var results: [ComicToDiscouse]?
}

struct ComicToDiscouseData: Codable {
    var data: ComicsToDiscouse?
}

struct ComicDate: Codable {
    var type: String?
    var date: String?
}
