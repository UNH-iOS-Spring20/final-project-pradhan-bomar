//
//  Items.swift
//  AltruisMaze
//
//  Created by Bomar, Shawn L on 2/23/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
//

class DoorKey{
    var color: String
    var name: String
    init?(color: String) {
        self.color = color
        self.name = color + " Key"
        if color.isEmpty{
            return nil
        }
    }
}

class Photo{
    var name: String
    init(name: String){
        self.name = "This is a Photo you took." //Temp Placeholder
    }
}

class Cipher{
    
}
