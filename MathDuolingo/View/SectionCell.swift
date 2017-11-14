//
//  SectionCell.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/11/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit
import Firebase

class SectionCell: UICollectionViewCell {
    
    //Setup design abilities for the cell in the storyboard
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0  {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
    
    @IBOutlet weak var sectionImage: UIImageView!
    @IBOutlet weak var sectionName: UILabel!
    
    var section: Section!
    
    func configueCell(section: Section) {
        self.section = section
        self.sectionName.text = section.name
        let ref = Storage.storage().reference(forURL: section.image)
        ref.getData(maxSize: 2 * 1024  * 1024) { (data, error) in
            if error != nil {
                print("Image could not be downloaded")
            } else {
                if let imgData = data {
                    if let img = UIImage(data: imgData) {
                        self.sectionImage.image = img
                    }
                }
            }
        }
    }
    
}
