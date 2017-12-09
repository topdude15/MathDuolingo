//
//  ProfileVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 12/8/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {

    @IBOutlet weak var profileImage: UIImageView!
    @IBOutlet weak var nameBox: UILabel!
    @IBOutlet weak var usernameBox: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }
    @IBAction func logOutTapped(_ sender: Any) {
        try! Auth.auth().signOut()
        self.performSegue(withIdentifier: "logOut", sender: nil)
    }
}
