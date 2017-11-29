//
//  QuestionVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/23/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class QuestionVC: UIViewController {

    var questions = [snapshot]()
    var questionNumber = 0
    override func viewDidLoad() {
        super.viewDidLoad()
        Database.database().reference().child("subjects").child(Util.ds.subjectKey).child("sections").child(Util.ds.sectionKey).child("questions").observeSingleEvent(of: .value) { (snapshot) in
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    self.questions.append(snap)
                }
            }
        }
    }
}
