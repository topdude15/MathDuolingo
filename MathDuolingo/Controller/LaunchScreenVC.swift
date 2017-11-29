//
//  LaunchScreenVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/17/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class LaunchScreenVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        if (Auth.auth().currentUser?.uid) != nil {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                self.performSegue(withIdentifier: "loggedIn", sender: nil)
            })
        } else {
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
              self.performSegue(withIdentifier: "start", sender: nil)
            })
        }
    }
}
