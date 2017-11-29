//
//  CustomImage.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/18/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit

@IBDesignable
class CustomImage: UIImageView {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }

}
