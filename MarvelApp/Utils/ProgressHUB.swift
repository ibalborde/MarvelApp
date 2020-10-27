//
//  ProgressHUB.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 26/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit
import SVProgressHUD

struct ProgressHUD {
    
    public static func initialize() {
        SVProgressHUD.setDefaultStyle(.light)
        SVProgressHUD.setDefaultMaskType(.black)
        SVProgressHUD.setForegroundColor(.foregroundColorProgres())
    }
    
    public static func show() {
        SVProgressHUD.show(withStatus: "Cargando")
    }
    
    public static func dismiss() {
        SVProgressHUD.dismiss()
    }
    
    public static func dismiss(withDelay delay: TimeInterval, completionHandler: @escaping () -> ()) {
        SVProgressHUD.dismiss(withDelay: delay, completion: completionHandler)
    }
    
}
