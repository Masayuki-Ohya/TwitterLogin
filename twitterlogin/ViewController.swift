//
//  ViewController.swift
//  twitterlogin
//
//  Created by 大矢政行 on 2020/05/07.
//  Copyright © 2020 masayuki.ohya. All rights reserved.
//

import UIKit
import FirebaseAuth
import TwitterKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let logInButton = TWTRLogInButton(logInCompletion: { session, error in
            if let session = session {
                let authToken = session.authToken
                let authTokenSecret = session.authTokenSecret
                let credential = TwitterAuthProvider.credential(withToken: session.authToken, secret: session.authTokenSecret)
                Auth.auth().signIn(with: credential) { (authResult, error) in
                    if let error = error { return }
                    
                }
            }
        })
        
        logInButton.center = self.view.center
        self.view.addSubview(logInButton)
        
    }
    

}

