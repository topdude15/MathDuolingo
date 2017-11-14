//
//  SubjectVC.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 10/29/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class SectionVC: UIViewController, UICollectionViewDelegate, UICollectionViewDataSource {

    var key: String = ""
    var sections = [Section]()
    
    @IBOutlet weak var collectionView: UICollectionView!
    @IBOutlet weak var subjectTitle: UILabel!
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sections.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let section = sections[indexPath.row]
        if let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sectionCell", for: indexPath) as? SectionCell {
            cell.configueCell(section: section)
            return cell
        } else {
            return SectionCell()
        }
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        collectionView.delegate = self
        collectionView.dataSource = self
        key = Util.ds.subjectKey
       
        Database.database().reference().child("subjects").child(key).child("sections").observe(.value) { (snapshot) in
            self.sections = []
            if let snapshot = snapshot.children.allObjects as? [DataSnapshot] {
                for snap in snapshot {
                    if let postDict = snap.value as? Dictionary<String, AnyObject> {
                        let key = snap.key
                        let section = Section(postKey: key, postData: postDict)
                        self.sections.append(section)
                        self.collectionView.reloadData()
                    }
                }
            }
        }
        
        Database.database().reference().child("subjects").child(key).observeSingleEvent(of: .value) { (snapshot) in
            if let dictionary = snapshot.value as? Dictionary<String, AnyObject> {
                self.subjectTitle.text = dictionary["name"] as? String
            }
        }
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
