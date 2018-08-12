//
//  ViewController.swift
//  Blaze
//
//  Created by Ravi Tripathi on 22/07/18.
//  Copyright © 2018 Ravi Tripathi. All rights reserved.
//

import UIKit
import GoogleSignIn
import FirebaseAuth

class ViewController: UIViewController, GIDSignInUIDelegate {

    override func viewDidLoad() {
        super.viewDidLoad()
        GIDSignIn.sharedInstance().uiDelegate = self
        //For silent sign in
        GIDSignIn.sharedInstance().signIn()
    }

}

