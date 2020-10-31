//
//  ExpandableNames.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 29/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import Foundation



class ExpandableComic {
    private(set) var isExpanded = false
    var shouldFetchComicsToDiscouse: Bool {
        return self.isExpanded && comicsToDiscouse.isEmpty
    }
    var comicsToDiscouse = [ComicToDiscouse]()
    var cellsCount: Int {
        if isExpanded {
            return comicsToDiscouse.count + 2
        }
        return 1
    }
    let comicEvent: ComicEvent
    
    func getCellID(index: Int) -> String{
        if index == 0 {
            return "cellHeader"
        } else if index == 1 {
            return CenterTitleCell.cellId
        } else {
            return TitleDateCell.cellId
        }
    }
    
    func toggle() {
        self.isExpanded = !self.isExpanded
    }
    
    init(comicEvent: ComicEvent) {
        self.comicEvent = comicEvent
    }
    
}
