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

        if let uid = Auth.auth().currentUser?.uid {
            print(uid)
        } else {
            print("Not logged in")
        }
    }
}
