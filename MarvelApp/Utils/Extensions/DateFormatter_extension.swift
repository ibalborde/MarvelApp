//
//  DateFormatter_extension.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 31/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import Foundation

extension DateFormatter {

    convenience init (format: String) {
        self.init()
        dateFormat = format
        locale = Locale.current
    }
}

extension String {

    func toDate (dateFormatter: DateFormatter) -> Date? {
        return dateFormatter.date(from: self)
    }

    func toDateString (dateFormatter: DateFormatter, outputFormat: String) -> String? {
        guard let date = toDate(dateFormatter: dateFormatter) else { return nil }
        return DateFormatter(format: outputFormat).string(from: date)
    }
    func toDateHeaderString (dateFormatter: DateFormatter) -> String? {
         let outputFormat = "dd 'de' MMMM yyyy"
         guard let date = toDate(dateFormatter: dateFormatter) else { return nil }
         return DateFormatter(format: outputFormat).string(from: date)
     }
    func toDateTitleString (dateFormatter: DateFormatter) -> String? {
            let outputFormat = "yyyy"
            guard let date = toDate(dateFormatter: dateFormatter) else { return nil }
            return DateFormatter(format: outputFormat).string(from: date)
        }
}

extension Date {

    func toString (dateFormatter: DateFormatter) -> String? {
        return dateFormatter.string(from: self)
    }
}
