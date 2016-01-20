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
    
    
    
    @IBOutlet weak var editButton: UIBarButtonItem!
    @IBOutlet weak var myTableView: UITableView!
    
    
    
    
    
    var superheroes : [SuperheroClass] = []


    override func viewDidLoad() {
        super.viewDidLoad()
        
        //set tableview source and delegate to view controller
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
        
        superheroes.append(SuperheroClass(Name: "Batman", Alias: "Bruce Wayne", Power: 70, Image: UIImage(named: "default")!))
        superheroes.append(SuperheroClass(Name: "Superman", Alias: "Clark Kent", Power: 99, Image: UIImage(named: "default")!))
        superheroes.append(SuperheroClass(Name: "Aquaman", Alias: "Arthur Curry", Power: 75, Image: UIImage(named: "default")!))
        superheroes.append(SuperheroClass(Name: "Wonder Woman", Alias: "Diana of Themyscila", Power: 90, Image: UIImage(named: "default")!))
        superheroes.append(SuperheroClass(Name: "The Flash", Alias: "Barry Allen", Power: 80, Image: UIImage(named: "default")!))
        superheroes.append(SuperheroClass(Name: "Spiderman", Alias: "Peter Parker", Power: 70, Image: UIImage(named: "default")!))


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
            self.superheroes.append(SuperheroClass(Name: superHeroTF.text!, RealName: aliasTF.text!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        
        self.presentViewController(myAlert, animated: true, completion: nil) //presents alert view
    }
    
    
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem) {
        
        if editButton.tag == 0 {
            myTableView.editing = true
            editButton.tag = 1
        } else {
            myTableView.editing = false
            editButton.tag = 0
        }
        
        
    }
    
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true
    }
    
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath) {
        
        let superhero = superheroes[sourceIndexPath.row]
        superheroes.removeAtIndex(sourceIndexPath.row)
        
        superheroes.insert(superhero, atIndex: destinationIndexPath.row)
    }
    
    
    
    //REQUIRED FUNCTIONS for TableView Protocols
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell { //Sends data to cell
        
        //create cell variable for tableView
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        
        //sets properties of the cell
        myCell.textLabel?.text = superheroes[indexPath.row].name
        myCell.detailTextLabel?.text = superheroes[indexPath.row].alias
        
        return myCell
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int { //sets num rows in table
        return superheroes.count
    }
    
    
    //allows you to delete a row from your table view
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        
        if editingStyle == .Delete {
            superheroes.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    
}

