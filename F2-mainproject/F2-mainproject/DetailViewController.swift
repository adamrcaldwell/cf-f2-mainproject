//
//  DetailViewController.swift
//  F2-mainproject
//
//  Created by Adam Caldwell on 11/9/14.
//  Copyright (c) 2014 Adam Caldwell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {

    @IBOutlet weak var firstNameLabel: UILabel!
    
    @IBOutlet weak var lastNameLabel: UILabel!
    
    var selectedPerson: Person = Person(firstName: "", lastName: "", isStudent: true)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedPerson.returnFullName()
        self.firstNameLabel.text = selectedPerson.firstName
        self.lastNameLabel.text = selectedPerson.lastName
        
        // Do view setup here.
    }
    
}
