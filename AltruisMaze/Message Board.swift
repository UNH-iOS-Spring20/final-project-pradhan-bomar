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
    
    public var PreviousRoom: String = "Room 1N"
    
    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        
        //Frame Measurements for Positioning
        let refX = self.frame.size.width, refY = self.frame.size.height
        
        //Exit Button
        //Icon from freeicon.com
        let exitButton = SKSpriteNode(imageNamed: "exitButton.png")
        exitButton.position = CGPoint(x: refX/10, y: refY/10)
        exitButton.name = "exitButton"
        self.addChild(exitButton)
        
        
        
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    
        if let touch = touches.first {
            let location = touch.location(in: self)
            let nodesarray = nodes(at: location)
            for node in nodesarray {
                if node.name == "exitButton"{
                    let returnScene = GameScene(fileNamed: PreviousRoom)
                    let transition = SKTransition.doorsOpenHorizontal(withDuration: 0.45)
                    returnScene!.scaleMode = .aspectFill
                    scene?.view?.presentScene(returnScene!, transition: transition)
                }
            }
        }
    }
}
