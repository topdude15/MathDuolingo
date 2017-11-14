//
//  CustomCollectionCell.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/3/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit

class CustomCollectionCell: UICollectionViewCell {
    
    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }
}
