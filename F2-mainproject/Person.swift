//
//  PersonClass.swift
//  F2-mainproject
//
//  Created by Adam Caldwell on 11/1/14.
//  Copyright (c) 2014 Adam Caldwell. All rights reserved.
//

import Foundation
import UIKit

class Person : NSObject, NSCoding {
    var firstName : String
    var lastName : String
    var image : UIImage?
    
    init (firstName : String, lastName : String) {
        self.firstName = firstName
        self.lastName = lastName
    }
    
    required init(coder aDecoder: NSCoder) {
        self.firstName = aDecoder.decodeObjectForKey("firstName") as String
        self.lastName = aDecoder.decodeObjectForKey("lastName") as String
        if let decodedImage = aDecoder.decodeObjectForKey("image") as? UIImage {
            self.image = decodedImage
        }
    }
    
    func encodeWithCoder(aCoder: NSCoder) {
        aCoder.encodeObject(self.firstName, forKey: "firstName")
        aCoder.encodeObject(self.lastName, forKey: "lastName")
        if self.image != nil {
            aCoder.encodeObject(self.image!, forKey: "image")
        } else {
            aCoder.encodeObject(nil, forKey: "image")
        }
    }
    
    func returnFullName () -> String {
        var fullName : String = self.firstName + " " + self.lastName
        return fullName
    }
}