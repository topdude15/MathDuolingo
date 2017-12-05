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

    //Storyboard References
    @IBOutlet weak var numberBar: UIPageControl!
    @IBOutlet weak var questionBox: UILabel!
    @IBOutlet weak var answer1: CustomButton!
    @IBOutlet weak var answer2: CustomButton!
    @IBOutlet weak var answer3: CustomButton!
    @IBOutlet weak var answer4: CustomButton!
    
    // var questions = [snapshot]()
    var numberCorrect = 0
    var questionNumber = 0
    var correctAnswer = 1
    
    var randNumber = "0"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Database.database().reference().child("subjects").child(Util.ds.subjectKey).child("sections").child(Util.ds.sectionKey).child("questions").child("totalQuestions").observeSingleEvent(of: .value, with: {(Snap) in
            let totalNoOfTest = Snap.value as! Int
            let randNum = Int(arc4random_uniform(UInt32(totalNoOfTest))) + 1
            self.randNumber = String(randNum)
            self.getQuestion()
        })
    }
    func getQuestion() {
    Database.database().reference().child("subjects").child(Util.ds.subjectKey).child("sections").child(Util.ds.sectionKey).child("questions").child(randNumber).observeSingleEvent(of: .value) { (snapshot) in
            if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
                let question = dictionary["question"] as? String
                let answer1Text = dictionary["answer1"] as? String
                let answer2Text = dictionary["answer2"] as? String
                let answer3Text = dictionary["answer3"] as? String
                let answer4Text = dictionary["answer4"] as? String
                self.questionBox.text = question
                self.answer1.setTitle(answer1Text, for: .normal)
                self.answer2.setTitle(answer2Text, for: .normal)
                self.answer3.setTitle(answer3Text, for: .normal)
                self.answer4.setTitle(answer4Text, for: .normal)
                self.correctAnswer = (dictionary["correctAnswer"] as? Int)!
            }
        }
    }
    @IBAction func button1Tapped(_ sender: Any) {
        if correctAnswer == 1 {
            print("1 is the correct answer")
        } else {
            
        }
    }
    @IBAction func button2Tapped(_ sender: Any) {
        if correctAnswer == 2 {
            print("2 is the correct answer")
        } else {
            
        }
    }
    @IBAction func button3Tapped(_ sender: Any) {
        if correctAnswer == 3 {
            print("3 is the correct answer")
        } else {
            
        }
    }
    
    @IBAction func button4Tapped(_ sender: Any) {
        if correctAnswer == 4 {
            print("4 is the correct answer")
        } else {
            
        }
    }
    
}
