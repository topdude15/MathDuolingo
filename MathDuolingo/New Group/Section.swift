//
//  Section.swift
//  MathDuolingo
//
//  Created by Trevor Rose on 11/11/17.
//  Copyright © 2017 Trevor Rose. All rights reserved.
//

import Foundation

class Section {
    
    private var _name: String!
    private var _image: String!
    private var _sectionKey: String!
    
    var name: String {
        return _name
    }
    var image: String {
        return _image
    }
    var sectionKey: String {
        return _sectionKey
    }
    
    init(postKey: String, postData: Dictionary<String, AnyObject>) {
        if let name = postData["name"] as? String, let image = postData["image"] as? String, let sectionKey = postData["key"] as? String {
            self._name = name
            self._image = image
            self._sectionKey = sectionKey
        }
    }
}
