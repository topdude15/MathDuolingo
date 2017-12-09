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
    @IBOutlet weak var continueButton: CustomButton!
    
    // var questions = [snapshot]()
    let numberRequired = 4
    var numberCorrect = 0
    var questionNumber = 0
    var correctAnswer = 1
    var questionsAnswered = Array<Int>()
    var firstTry = true
    
    override func viewDidLoad() {
        super.viewDidLoad()
        Database.database().reference().child("subjects").child(Util.ds.subjectKey).child("sections").child(Util.ds.sectionKey).child("questions").child("totalQuestions").observeSingleEvent(of: .value, with: {(Snap) in
            let totalNoOfTest = Snap.value as! Int
            let randNum = Int(arc4random_uniform(UInt32(totalNoOfTest))) + 1
            let randNumber = String(randNum)
            self.questionsAnswered.append(randNum)
            self.getQuestion(randNum: randNumber)
        })
    }
    func getQuestion(randNum: String) {
        self.numberBar.currentPage = numberCorrect
        self.answer1.isUserInteractionEnabled = true
        self.answer2.isUserInteractionEnabled = true
        self.answer3.isUserInteractionEnabled = true
        self.answer4.isUserInteractionEnabled = true
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            UIView.animate(withDuration: 1) {
                self.answer1.alpha = 1
                self.answer2.alpha = 1
                self.answer3.alpha = 1
                self.answer4.alpha = 1
                self.answer1.backgroundColor = UIColor.green
                self.answer2.backgroundColor = UIColor.green
                self.answer3.backgroundColor = UIColor.green
                self.answer4.backgroundColor = UIColor.green
                self.answer1.frame = CGRect(x: 16, y: 305, width: 150, height: 150)
                self.answer2.frame = CGRect(x: 205, y: 305, width: 150, height: 150)
                self.answer3.frame = CGRect(x: 16, y: 479, width: 150, height: 150)
                self.answer4.frame = CGRect(x: 205, y: 479, width: 150, height: 150)
            }
        }
        
    Database.database().reference().child("subjects").child(Util.ds.subjectKey).child("sections").child(Util.ds.sectionKey).child("questions").child(randNum).observeSingleEvent(of: .value) { (snapshot) in
            if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
                if self.firstTry == true {
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
                } else {
                    self.firstTry = false
                    DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
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
                    })
                }
                
            }
        }
    }
    @IBAction func button1Tapped(_ sender: Any) {
        if correctAnswer == 1 {
            UIView.animate(withDuration: 0.5, animations: {
                self.answer2.alpha = 0
                self.answer3.alpha = 0
                self.answer4.alpha = 0
                self.answer2.backgroundColor = UIColor.red
                self.answer3.backgroundColor = UIColor.red
                self.answer4.backgroundColor = UIColor.red
            })
            self.answer1.setTitle("title", for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                UIView.animate(withDuration: 1, animations: {
                    self.answer1.frame = CGRect(x: (self.view.frame.width / 2) - 100, y: self.view.frame.height / 2 + 50, width: 200, height: 200)
                })
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.continueButton.isUserInteractionEnabled = true
                    UIView.animate(withDuration: 1, animations: {
                        self.continueButton.alpha = 1
                    })
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.answer1.backgroundColor = UIColor.red
                self.answer1.isUserInteractionEnabled = false
            })
        }
    }
    @IBAction func button2Tapped(_ sender: Any) {
        if correctAnswer == 2 {
            UIView.animate(withDuration: 0.5, animations: {
                self.answer1.alpha = 0
                self.answer3.alpha = 0
                self.answer4.alpha = 0
                self.answer1.backgroundColor = UIColor.red
                self.answer3.backgroundColor = UIColor.red
                self.answer4.backgroundColor = UIColor.red
            })
            self.answer2.setTitle("title", for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                UIView.animate(withDuration: 1, animations: {
                    self.answer2.frame = CGRect(x: (self.view.frame.width / 2) - 100, y: self.view.frame.height / 2 + 25, width: 200, height: 200)
                    
                })
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.continueButton.isUserInteractionEnabled = true
                    UIView.animate(withDuration: 1, animations: {
                        self.continueButton.alpha = 1
                    })
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.answer2.backgroundColor = UIColor.red
                self.answer2.isUserInteractionEnabled = false
            })
        }
    }
    @IBAction func button3Tapped(_ sender: Any) {
        if correctAnswer == 3 {
            UIView.animate(withDuration: 0.5, animations: {
                self.answer1.alpha = 0
                self.answer2.alpha = 0
                self.answer4.alpha = 0
                self.answer1.backgroundColor = UIColor.red
                self.answer2.backgroundColor = UIColor.red
                self.answer4.backgroundColor = UIColor.red
            })
            self.answer3.setTitle("Title", for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.answer3.frame = CGRect(x: (self.view.frame.width / 2) - 100, y: self.view.frame.height / 2 + 50, width: 200, height: 200)
                })
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.continueButton.isUserInteractionEnabled = true
                    UIView.animate(withDuration: 1, animations: {
                        self.continueButton.alpha = 1
                    })
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.answer3.backgroundColor = UIColor.red
                self.answer3.isUserInteractionEnabled = false
            })
        }
    }
    
    @IBAction func button4Tapped(_ sender: Any) {
        if correctAnswer == 4 {
            UIView.animate(withDuration: 0.5, animations: {
                self.answer1.alpha = 0
                self.answer2.alpha = 0
                self.answer3.alpha = 0
                self.answer1.backgroundColor = UIColor.red
                self.answer2.backgroundColor = UIColor.red
                self.answer3.backgroundColor = UIColor.red
            })
            self.answer4.setTitle("Title", for: .normal)
            DispatchQueue.main.asyncAfter(deadline: .now() + 1, execute: {
                UIView.animate(withDuration: 0.5, animations: {
                    self.answer4.frame = CGRect(x: (self.view.frame.width / 2) - 100, y: self.view.frame.height / 2 + 50, width: 200, height: 200)
                })
            })
            DispatchQueue.main.asyncAfter(deadline: .now() + 2, execute: {
                self.continueButton.isUserInteractionEnabled = true
                    UIView.animate(withDuration: 1, animations: {
                        self.continueButton.alpha = 1
                    })
            })
        } else {
            UIView.animate(withDuration: 1, animations: {
                self.answer4.backgroundColor = UIColor.red
                self.answer4.isUserInteractionEnabled = false
            })
            
        }
    }
    func getNewQuestion() {
        Database.database().reference().child("subjects").child(Util.ds.subjectKey).child("sections").child(Util.ds.sectionKey).child("questions").child("totalQuestions").observeSingleEvent(of: .value, with: {(Snap) in
            let totalNoOfTest = Snap.value as! Int
            let randNum = Int(arc4random_uniform(UInt32(totalNoOfTest))) + 1
            self.checkQuestion(randNum: randNum)
        })
    }
    
    func checkQuestion(randNum: Int) {
        if (self.questionsAnswered.contains(randNum)) {
            self.getNewQuestion()
        } else {
            let questionNum = String(randNum)
            self.questionsAnswered.append(randNum)
            self.getQuestion(randNum: questionNum)
        }
    }
    
    
    @IBAction func continuePressed(_ sender: Any) {
        UIView.animate(withDuration: 1) {
            self.continueButton.alpha = 0
        }
        self.numberCorrect = numberCorrect + 1
        if (numberCorrect >= numberRequired) {
            self.performSegue(withIdentifier: "finish", sender: nil)
        } else {
            self.getNewQuestion()
        }
        
    }
}
