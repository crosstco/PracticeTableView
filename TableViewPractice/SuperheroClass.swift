//
//  SuperheroClass.swift
//  TableViewPractice
//
//  Created by Colin on 1/15/16.
//  Copyright © 2016 ccross. All rights reserved.
//

import UIKit

class SuperheroClass: NSObject {
    
    var name : String = ""
    var alias : String = ""
    var power : Int = 0
    var image : UIImage = UIImage(named: "default")!
    
    
    init(Name : String, Alias : String, Power : Int, Image : UIImage) {
        
        super.init()
        name = Name
        alias = Alias
        power = Power
        image = Image
}
    
    init(Name: String, RealName: String) {
        super.init()
        name = Name
        alias = RealName
    }


}