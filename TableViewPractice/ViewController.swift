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
    
    
}

