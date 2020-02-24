//
//  Inventory.swift
//  AltruisMaze
//
//  Created by Bomar, Shawn L on 2/23/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
//

class Inventory{
    var keys = [DoorKey]()
    func pickupKey(key: DoorKey) {
        keys.append(key)
    }
    
    var photos = [Photo]()
    func takePhoto(pic: Photo){
        photos.append(pic)
    }
    
    var ciphers = [Cipher]()
    func findCipher(code: Cipher){
        ciphers.append(code)
    }
    
    
    
    
}
