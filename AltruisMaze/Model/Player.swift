//
//  Player.swift
//  AltruisMaze
//
//  Created by Bomar, Shawn L on 2/23/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
//  Precedent taken from C-Hefele's PizzaHub

class Player{
    var name: String
    var tradePoints: Int
    var altruismPoints: Int
    var backpack: Inventory
    init?(name: String, tradePoints: Int, altruismPoints: Int){
        if name.isEmpty || tradePoints < 0 || altruismPoints < 0 {
            return nil
        }
        self.name = name
        self.tradePoints = tradePoints
        self.altruismPoints = altruismPoints
        self.backpack = defaultInventory
    }
}




