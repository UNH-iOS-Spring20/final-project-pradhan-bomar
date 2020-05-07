//
//  Message Board.swift
//  AltruisMaze
//
//  Created by iphone on 5/6/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
//

import SpriteKit
import GameplayKit

class MessageBoard: SKScene {
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        if let touch = touches.first {
            let location = touch.location(in: self)
            let nodesarray = nodes(at: location)
            for node in nodesarray {
                
            }
        }
    }
}
