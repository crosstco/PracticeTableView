//
//  ViewController.swift
//  TableViewPractice
//
//  Created by Colin on 1/13/16.
//  Copyright © 2016 ccross. All rights reserved.
//

import UIKit


    //bring in datasource and delegate protocols for tableviews

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {
    
    @IBOutlet weak var myTableView: UITableView!
    
    var superheroes = ["Batman", "Superman", "Aquaman", "Wonder Woman", "The Flash", "Spiderman"]
    var realNames = ["Bruce Wayne", "Clark Kent", "Arthur Curry", "Diana of Themyscira", "Barry Allen", "Peter Parker"]
    

    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set tableview source and delegate to view controller
        myTableView.dataSource = self
        myTableView.delegate = self
    }
    
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem) {
        let myAlert = UIAlertController(title: "Add Superhero", message: nil, preferredStyle: .Alert)
        
        myAlert.addTextFieldWithConfigurationHandler { (nameTextField) -> Void in
            nameTextField.placeholder = "Add Superhero Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (aliasTextField) -> Void in
            aliasTextField.placeholder = "Add Superhero Alias"
        }
        
        let cancelAction = UIAlertAction(title: "Cancel", style: .Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (add) -> Void in
            let superHeroTF = myAlert.textFields![0] as UITextField
            let aliasTF = myAlert.textFields![1] as UITextField
            self.superheroes.append(superHeroTF.text!)
            self.realNames.append(aliasTF.text!)
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil) //presents alert view
    }
    
    
    //REQUIRED FUNCTIONS for TableView Protocols
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { //Sends data to cell
        
        //create cell variable for tableView
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        //sets properties of the cell
        myCell.textLabel?.text = superheroes[indexPath.row]
        myCell.detailTextLabel?.text = realNames[indexPath.row]
        
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //sets num rows in table
        return superheroes.count
    }
    
    
    //allows you to delete a row from your table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            superheroes.removeAtIndex(indexPath.row)
            realNames.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
}

