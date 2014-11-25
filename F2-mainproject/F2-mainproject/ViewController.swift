//
//  ViewController.swift
//  F2-mainproject
//
//  Created by Adam Caldwell on 11/1/14.
//  Copyright (c) 2014 Adam Caldwell. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var tableView: UITableView!
    
    var namesList = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if let peopleFromArchive = self.loadFromArchive() as [Person]? {
            self.namesList = peopleFromArchive
        } else {
            self.loadFromPlist()
            self.saveToArchive()
        }
        var hasLaunched = NSUserDefaults.standardUserDefaults().boolForKey("firstTime")
        
        if hasLaunched == false {
            NSUserDefaults.standardUserDefaults().setBool(true, forKey: "firstTime")
        }
        
        self.title = "Class Roster"
        self.tableView.dataSource = self
        self.tableView.delegate = self
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    override func viewWillAppear(animated: Bool) {
        super.viewWillAppear(animated)
        self.tableView.reloadData()
        self.saveToArchive()
    }
    
    func loadFromArchive() -> [Person]? {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        
        if let peopleFromArchive = NSKeyedUnarchiver.unarchiveObjectWithFile(documentsPath + "/archive") as? [Person] {
            return peopleFromArchive
        }
            return nil
    }
    
    func saveToArchive() {
        let documentsPath = NSSearchPathForDirectoriesInDomains(.DocumentDirectory, .UserDomainMask, true)[0] as String
        NSKeyedArchiver.archiveRootObject(self.namesList, toFile: documentsPath + "/archive")
    }
    
    func loadFromPlist() {
        
        let plistURL = NSBundle.mainBundle().pathForResource("Roster", ofType: "plist")
        let plistArray = NSArray(contentsOfFile: plistURL!)
        for object in plistArray! {
            if let personDictionary = object as? NSDictionary {
                let firstNameFiller = personDictionary["First Name"] as String
                let lastNameFiller = personDictionary["Last Name"] as String
                var person = Person(firstName: firstNameFiller, lastName: lastNameFiller)
                self.namesList.append(person)
            }
        }
        
        
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.namesList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as PersonTableViewCell
        var personToDisplay = self.namesList[indexPath.row]
        cell.personLabel.text = personToDisplay.returnFullName()
        cell.personImage.image = personToDisplay.image
        return cell
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == "SHOW_DETAIL" {
            let detailViewController = segue.destinationViewController as DetailViewController
            let selectedIndexPath = self.tableView.indexPathForSelectedRow()
            var personToPass = self.namesList[selectedIndexPath!.row]
            detailViewController.selectedPerson = personToPass
        }
    }

}

