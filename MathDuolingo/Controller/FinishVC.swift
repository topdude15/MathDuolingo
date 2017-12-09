//
//  FinishVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 12/8/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class FinishVC: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let date = Date()
        let formatter = DateFormatter()
        formatter.dateFormat = "MM.dd.yyyy"
        let currentDateString = removeSpecialCharsFromString(text: formatter.string(from: date))
        
        let uid = Auth.auth().currentUser?.uid
        Database.database().reference().child("users").child(uid!).child(currentDateString).observeSingleEvent(of: .value) { (snapshot) in
            if snapshot.hasChild("pointsToday") {
                if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
                    let amount = dictionary["pointsToday"] as! Int
                    let scoreAmount: Int = amount + 10
                    let score: Dictionary<String, Any> = [
                        "pointsToday": scoreAmount
                    ]
                        Database.database().reference().child("users").child(uid!).child(currentDateString).updateChildValues(score)
                        print("Updated")
                    
                }
            } else {
                let score: Dictionary<String, Any> = [
                    "pointsToday": 10
                ]
                Database.database().reference().child("users").child(uid!).child(currentDateString).updateChildValues(score)
                print("Updated")
                
            }
        }
        
        Database.database().reference().child("users").child(uid!).child(currentDateString).observeSingleEvent(of: .value) { (snapshot) in
            if let dictionary = snapshot.value as? Dictionary<String, Any> {
                print("You have earned " + String(describing: dictionary["pointsToday"]) + " points today")
            }
        }
    }
    @IBAction func continuePressed(_ sender: Any) {
        self.performSegue(withIdentifier: "backToSubject", sender: nil)
    }
    func removeSpecialCharsFromString(text: String) -> String {
        let okayChars : Set<Character> =
            Set("0123456789")
        return String(text.filter {okayChars.contains($0) })
    }
    
}
