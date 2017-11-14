//
//  SubjectCell.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 10/29/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class SubjectCell: UITableViewCell {

    @IBOutlet weak var subjectName: UILabel!
    @IBOutlet weak var subjectImage: UIImageView!
    
    var subject: Subject!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    func configureCell(subject: Subject) {
        self.subject = subject
        self.subjectName.text = subject.name
        let ref = Storage.storage().reference(forURL: subject.image)
        ref.getData(maxSize: 2 * 1024 * 1024) { (data, error) in
            if error != nil {
                print("Image could not be downloaded")
            } else {
                if let imgData = data {
                    if let img = UIImage(data: imgData) {
                        self.subjectImage.image = img
                    }
                }
            }
        }
    }
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
