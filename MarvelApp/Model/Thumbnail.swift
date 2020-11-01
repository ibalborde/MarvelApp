//
//  Thumbnail.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 27/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import Foundation

struct Thumbnail: Codable {
    var path: String?
    var imageExtension: String?
    var url: URL? {
        guard
            let path = self.path,
            let imageExtension = self.imageExtension else { return nil }
        return URL(string: "\(path)/standard_large.\(imageExtension)")
    }
    var urlLarge: URL? {
          guard
              let path = self.path,
              let imageExtension = self.imageExtension else { return nil }
          return URL(string: "\(path)/portrait_incredible.\(imageExtension)")
      }
    
    enum CodingKeys: String, CodingKey {
        case path
        case imageExtension = "extension"
    }
}
