// Playground - noun: a place where people can play

import UIKit

class Person {
    var firstName : String
    var lastName : String
    var isStudent : Bool
    
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

var adam = Person(firstName: "Adam", lastName: "Caldwell", isStudent: true)

adam.returnFullName()
