//
//  EventData.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import Foundation

struct ComicEvent: Codable {
    var title: String?
    var description: String?
    var thumbnail: Thumbnail?
    var start: String?
    var end: String?
    var comics: Comic?
}

struct Comic: Codable {
    var collectionURI: String?
}


struct ComicsEvents: Codable {
    var results: [ComicEvent]?
}

struct ComicEventsData: Codable {
    var data: ComicsEvents?
}
