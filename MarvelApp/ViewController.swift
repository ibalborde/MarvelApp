//
//  ViewController.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 26/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit
import FirebaseUI

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        Auth.auth().addStateDidChangeListener { (auth, user) in
            if let user = user {
                       self.showUserInfo(user:user)
                   } else {
                       self.showLoginVC()
                   }
        }
    }
    
    func showUserInfo(user:User) {
        performSegue(withIdentifier: "HomeTabViewController", sender: self)
    }
    
    func showLoginVC() {
        
        let authUI = FUIAuth.defaultAuthUI()
        guard authUI != nil else { return }
        let providers = [FUIEmailAuth()]
        authUI?.providers = providers
        let authViewController = authUI!.authViewController()
        authViewController.modalPresentationStyle = .fullScreen
        self.present(authViewController, animated: true, completion: nil)
    }
}

