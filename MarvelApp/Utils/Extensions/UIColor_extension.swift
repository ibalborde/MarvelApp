//
//  UIColor_extension.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 26/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit

extension UIColor {
    
    class func foregroundColorProgres() -> UIColor {
        return UIColor(rgb: 0x0b4677)
    }
    class func backgroundColor() -> UIColor {
           return UIColor(rgb: 0xecebf1)
       }
    
    convenience init(rgb: UInt) {
        self.init(
            red: CGFloat((rgb & 0xFF0000) >> 16) / 255.0,
            green: CGFloat((rgb & 0x00FF00) >> 8) / 255.0,
            blue: CGFloat(rgb & 0x0000FF) / 255.0,
            alpha: CGFloat(1.0)
        )
    }
}
