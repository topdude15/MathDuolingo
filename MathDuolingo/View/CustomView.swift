//
//  CustomView.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 10/29/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit

class CustomView: UIView {

    @IBInspectable
    public var cornerRadius: CGFloat = 2.0 {
        didSet {
            self.layer.cornerRadius = self.cornerRadius
        }
    }

}
