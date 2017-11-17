//
//  WelcomeVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/16/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    @IBAction func signUpTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "signUp", sender: nil)
    }
    @IBAction func signInTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "signIn", sender: nil)
    }
}
