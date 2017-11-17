//
//  CustomTextField.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/16/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import UIKit

@IBDesignable
class CustomTextField: UITextField {

    @IBInspectable var leftImage: UIImage? {
        didSet {
            updateView()
        }
    }
    func updateView() {
        if let image = leftImage {
            leftViewMode = .always
            
            let imageView = UIImageView(frame: CGRect(x: 3, y: 0, width: 30, height: 30))
            imageView.image = image
            
            let view = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
            view.addSubview(imageView)
            
            leftView = view
        } else {
            leftViewMode = .never
        }
    }

}
