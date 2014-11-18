//
//  DetailViewController.swift
//  F2-mainproject
//
//  Created by Adam Caldwell on 11/9/14.
//  Copyright (c) 2014 Adam Caldwell. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController, UITextFieldDelegate, UINavigationControllerDelegate, UIImagePickerControllerDelegate {
    
    @IBOutlet weak var firstNameTextField: UITextField!
    
    @IBOutlet weak var lastNameTextField: UITextField!
    
    @IBOutlet weak var imageField: UIImageView!
    
    var imagePickerController = UIImagePickerController()
    
    var selectedPerson: Person = Person(firstName: "", lastName: "", isStudent: true)
    
    
    func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = selectedPerson.returnFullName()
        self.firstNameTextField.delegate = self
        self.lastNameTextField.delegate = self
        self.firstNameTextField.text = selectedPerson.firstName
        self.lastNameTextField.text = selectedPerson.lastName
        self.imageField.image = selectedPerson.image
        
        // Do view setup here.
    }
    
    
    @IBAction func photoButtonPressed(sender: AnyObject) {
        if UIImagePickerController.isSourceTypeAvailable(UIImagePickerControllerSourceType.PhotoLibrary) {
            self.imagePickerController.sourceType = UIImagePickerControllerSourceType.PhotoLibrary
            self.imagePickerController.delegate = self
            self.imagePickerController.allowsEditing = true
            self.presentViewController(self.imagePickerController, animated: true, completion: nil)
        }
    }
    
    
    func imagePickerController(picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [NSObject : AnyObject]) {
        let image = info[UIImagePickerControllerEditedImage] as UIImage
        self.imageField.image = image
        imagePickerController.dismissViewControllerAnimated(true, completion: nil)
        self.selectedPerson.image = image
        
    }
    
}
