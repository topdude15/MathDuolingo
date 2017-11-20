//
//  SignUpVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/16/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class SignUpVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailBox: CustomTextField!
    @IBOutlet weak var passwordBox: CustomTextField!
    @IBOutlet weak var repeatPasswordBox: CustomTextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.emailBox.delegate = self
        self.passwordBox.delegate = self
        self.repeatPasswordBox.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    @IBAction func continueTapped(_ sender: Any) {
        let email = self.emailBox.text
        let password = self.passwordBox.text
        let repeatPassword = self.repeatPasswordBox.text
        if (password != repeatPassword) {
            print("Passwords are not the same")
        } else {
            Util.ds.email = email!
            Util.ds.password = password!
            self.performSegue(withIdentifier: "continue", sender: nil)
        }
    }
}
