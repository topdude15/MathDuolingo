//
//  CompleteProfileVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/17/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class CompleteProfileVC: UIViewController, UITextFieldDelegate {

    @IBOutlet weak var userImage: UIImageView!
    @IBOutlet weak var nameBox: UITextField!
    @IBOutlet weak var usernameBox: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

        self.nameBox.delegate = self
        self.usernameBox.delegate = self
        // Do any additional setup after loading the view.
    }
    func textFieldShouldReturn(_ textField: UITextField) -> Bool {
        self.view.endEditing(true)
        return false
    }
    @IBAction func finishTapped(_ sender: Any) {
        let email = Util.ds.email
        let password = Util.ds.password
        let name = self.nameBox.text
        let username = self.usernameBox.text
        Auth.auth().createUser(withEmail: email, password: password, completion: { (user, error) in
            if error != nil {
                print("Could not create new user")
            } else {
                if let uid = Auth.auth().currentUser?.uid {
                    let userInfo: Dictionary<String, AnyObject> = [
                        "name": name as AnyObject,
                        "username": username as AnyObject,
                        "email": email as AnyObject
                    ]
                    Database.database().reference().child("users").child(uid).updateChildValues(userInfo)
                    Util.ds.email = "email"
                    Util.ds.password = "password"
                    self.performSegue(withIdentifier: "finish", sender: nil)
                }
            }
        })
    }
}
