//
//  WelcomeVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/16/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit

class WelcomeVC: UIViewController {


    @IBOutlet weak var signUpButton: CustomButton!
    @IBOutlet weak var signInButton: CustomButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        self.signUpButton.alpha = 0
        self.signInButton.alpha = 0
        
        UIView.animate(withDuration: 1.5) {
            self.signUpButton.alpha = 0.9
        }
        DispatchQueue.main.asyncAfter(deadline: .now() + 1.5, execute: {
            UIView.animate(withDuration: 1.5, animations: {
                self.signInButton.alpha = 0.9
            })
        })
    }

    @IBAction func signUpTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "signUp", sender: nil)
    }
    @IBAction func signInTapped(_ sender: Any) {
        self.performSegue(withIdentifier: "signIn", sender: nil)
    }
}
