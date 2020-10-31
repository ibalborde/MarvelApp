//
//  Date_extension.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 31/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import Foundation

extension Date {
    
 func string(with format: String) -> String {
       let dateFormatter = DateFormatter()
       dateFormatter.dateFormat = format
       return dateFormatter.string(from: "2020-10-31 15:31:43.790762-0300")
   }
}

