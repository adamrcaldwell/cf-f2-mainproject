//
//  DetailViewController.swift
//  F2-mainproject
//
//  Created by Adam Caldwell on 11/9/14.
//  Copyright (c) 2014 Adam Caldwell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate {

//    @IBOutlet weak var firstNameLabel: UILabel!
//    
//    @IBOutlet weak var lastNameLabel: UILabel!
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    var selectedPerson: Person = Person(firstName: "", lastName: "", isStudent: true)
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedPerson.returnFullName()
//        self.firstNameLabel.text = selectedPerson.firstName
//        self.lastNameLabel.text = selectedPerson.lastName
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        
        // Do view setup here.
    }
    
}
