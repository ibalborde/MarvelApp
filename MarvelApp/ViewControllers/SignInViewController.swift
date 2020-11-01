//
//  ViewController.swift
//  MarvelApp
//
//  Created by Maximiliano Ibalborde on 26/10/2020.
//  Copyright © 2020 Maximiliano Ibalborde. All rights reserved.
//

import UIKit
import FirebaseUI

class SignInViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
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
        
        guard let authUI = FUIAuth.defaultAuthUI() else { return }
        authUI.providers = [FUIEmailAuth()]
        authUI.delegate = self
        let authViewController = authUI.authViewController()
        authViewController.modalPresentationStyle = .fullScreen
        self.present(authViewController, animated: true, completion: nil)
    }
}

extension SignInViewController: FUIAuthDelegate {
    
    func authUI(_ authUI: FUIAuth, didSignInWith authDataResult: AuthDataResult?, error: Error?) {
        if error != nil {
            return
        }
        performSegue(withIdentifier: "HomeTabViewController", sender: self)
    }
}

