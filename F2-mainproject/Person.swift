//
//  PersonClass.swift
//  F2-mainproject
//
//  Created by Adam Caldwell on 11/1/14.
//  Copyright (c) 2014 Adam Caldwell. All rights reserved.
//

import Foundation
import UIKit

class Person {
    var firstName : String
    var lastName : String
    var isStudent : Bool
    var image : UIImage?
    
    init (firstName : String, lastName : String, isStudent: Bool) {
        self.firstName = firstName
        self.lastName = lastName
        self.isStudent = isStudent
    }
    
    func returnFullName () -> String {
        var fullName : String = self.firstName + " " + self.lastName
        return fullName
    }
}