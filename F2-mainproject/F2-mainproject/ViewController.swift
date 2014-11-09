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
    
    var myPersonOne = Person(firstName: "Adam", lastName: "Caldwell", isStudent: true)
    var myPersonTwo = Person(firstName: "Rick", lastName: "Lopez", isStudent: false)
    var myPersonThree = Person(firstName: "Matthew", lastName: "Conquergood", isStudent: true)
    
    var namesList = [Person]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.tableView.dataSource = self
        self.tableView.delegate = self
        
        self.namesList.append(myPersonOne)
        self.namesList.append(myPersonTwo)
        self.namesList.append(myPersonThree)
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.namesList.count
    }

    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("PERSON_CELL", forIndexPath: indexPath) as UITableViewCell
        var personToDisplay = namesList[indexPath.row]
        cell.textLabel.text = personToDisplay.returnFullName()
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

