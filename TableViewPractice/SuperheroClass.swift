//
//  SuperheroClass.swift
//  TableViewPractice
//
//  Created by Colin on 1/15/16.
//  Copyright © 2016 ccross. All rights reserved.
//

import UIKit

class SuperheroClass: NSObject {
    
    var name : String
    var alias : String
    var power : Int
    var image : UIImage
    
    
    init(name : String, alias : String, power : Int, image : UIImage) {
        
        self.name = name
        self.alias = alias
        self.power = power
        self.image = image
        super.init()
        
    }
    
    convenience override init() {
        self.init(name: "", alias: "", power: 0, image: UIImage(named: "default")!)
    }
    

    convenience init(name: String, alias: String) {
        self.init(name: name, alias: alias, power: 0, image: UIImage(named: "default")!)
    }
    
}
