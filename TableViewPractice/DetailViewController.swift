//
//  DetailViewController.swift
//  TableViewPractice
//
//  Created by Colin on 1/19/16.
//  Copyright © 2016 ccross. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController {
    
    
    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var superHeroTF: UITextField!
    @IBOutlet weak var aliasTF: UITextField!
    @IBOutlet weak var powerTF: UITextField!
    
    var superHero : SuperheroClass!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        superHeroTF.text = superHero.name
        aliasTF.text = superHero.alias
        powerTF.text = String(superHero.power)
        imageView.image = superHero.image
    }
    
    
    @IBAction func saveButton(sender: AnyObject) {
        superHero.name = superHeroTF.text!
        superHero.alias = aliasTF.text!
        superHero.power = Int(powerTF.text!)!
    }
}
