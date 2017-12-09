//
//  SignInVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/14/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class SignInVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var emailBox: UITextField!
    @IBOutlet weak var passwordBox: UITextField!
    @IBOutlet weak var signInButton: CustomButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.emailBox.delegate = self
        self.passwordBox.delegate = self
        // Do any additional setup after loading the view.
    }
    @IBAction func signInTapped(_ sender: Any) {
        if let email = self.emailBox.text, let password = self.passwordBox.text {
            Auth.auth().signIn(withEmail: email, password: password) { (user, error) in
                if error != nil {
                    let alertController = UIAlertController(title: "Sign In Error", message: "The sign in request could not be completed.  Please try again.", preferredStyle: .alert)
                    let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
                    alertController.addAction(defaultAction)
                    self.present(alertController, animated: true, completion: nil)
                } else {
                    self.performSegue(withIdentifier: "signedIn",  sender: nil)
                }
            }
        } else {
            let alertController = UIAlertController(title: "Invalid Username/Password", message: "Please make sure you have input a valid username/password", preferredStyle: .alert)
            let defaultAction = UIAlertAction(title: "Close", style: .default, handler: nil)
            alertController.addAction(defaultAction)
            present(alertController, animated: true, completion: nil)
        }
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
}
