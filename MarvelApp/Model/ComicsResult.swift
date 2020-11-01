//
//  ComicsToDiscouse.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 30/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import Foundation

struct Comic: Codable {
    var title: String?
    var dates: [ComicDate]?
}

struct ComicsResult: Codable {
    var results: [Comic]?
}

struct Comics: Codable {
    var data: ComicsResult?
}

struct ComicDate: Codable {
    var type: String?
    var date: String?
}
