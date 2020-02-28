//
//  Items.swift
//  AltruisMaze
//
//  Created by Bomar, Shawn L on 2/23/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
//
import Foundation //Utilizing for Date Coding

class DoorKey{
    var color: String
    var name: String
    init(color: String) {
        self.color = color
        self.name = color + " Key"
    }
}

class Photo{
    var time: DateIntervalFormatter
    var location: String
    //In the Future, Room Number will be derived from the room itself.
    init(roomNumber: String){
        self.time = DateIntervalFormatter()
        self.time.dateStyle = .short
        self.location = "Room " + roomNumber
    }
}

class Cipher{
    var input: String
    var output: String
    
    init(input: String){
        self.input = input
        self.output = Cipher.decode(incoming: input)
    }
    
    //Function will use actual cryptography in the future. 
    class func decode(incoming: String) -> String{
        let outgoing: String = "Decoded Version of " + incoming
        return outgoing
    }
}
