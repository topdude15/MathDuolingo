//
//  CustomButton.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/12/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit

class CustomButton: UIButton {

    @IBInspectable var cornerRadius: CGFloat = 0 {
        didSet {
            layer.cornerRadius = cornerRadius
            layer.masksToBounds = cornerRadius > 0
        }
    }
    @IBInspectable var borderWidth: CGFloat = 0 {
        didSet {
            layer.borderWidth = borderWidth
            layer.masksToBounds = borderWidth > 0
        }
    }

}
