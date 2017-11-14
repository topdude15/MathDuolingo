//
//  Subject.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 10/29/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import Foundation

class Subject {
    
    private var _name: String!
    private var _image: String!
    private var _subjectKey: String!
    
    var name: String {
        return _name
    }
    var image: String {
        return _image
    }
    var subjectKey: String {
        return _subjectKey
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        if let name = postData["name"] as? String, let image = postData["image"] as? String, let subjectKey = postData["key"] as? String {
            self._name = name
            self._image = image
            self._subjectKey = subjectKey
        }
    }
}
