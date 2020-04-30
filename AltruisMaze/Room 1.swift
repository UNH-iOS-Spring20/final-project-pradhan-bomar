//
//  GameScene.swift
//  AltruisMaze
//
//  Created by Bomar, Shawn L on 2/23/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
// Pratigya begins Firebase

import SpriteKit
import GameplayKit

class GameScene: SKScene {

    //Test Comment to see if it commits
    
    override func didMove(to view: SKView) {
        //Rotation Button
        backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        let button = SKSpriteNode(imageNamed: "rotateButton.png")
        button.position = CGPoint(x: self.frame.size.width/10, y: self.frame.size.height/10)
        button.name = "rotateButton"
        self.addChild(button)
    }

    
    var entities = [GKEntity]()
    var graphs = [String : GKGraph]()
    
    private var lastUpdateTime : TimeInterval = 0
    private var label : SKLabelNode?
    private var spinnyNode : SKShapeNode?
    
    override func sceneDidLoad() {
        
        //Frictionless bounds set up on room
        let border = SKPhysicsBody(edgeLoopFrom: self.frame)
        border.friction = 0
        border.restitution = 0
        self.physicsBody = border
        
        self.lastUpdateTime = 0
        
      
    }
    
    
    func touchDown(atPoint pos : CGPoint) {
       
    }
    
    func touchMoved(toPoint pos : CGPoint) {
      
    }
    
    func touchUp(atPoint pos : CGPoint) {
      
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if let touch = touches.first {
            let location = touch.location(in: self)
            let nodesarray = nodes(at: location)
               
            for node in nodesarray {
                
                //Rotate Function
                if node.name == "rotateButton" {
                    let currentRoom = view?.scene!.name
                    let roomDirection = currentRoom?.last //Get last character of current room which is N or S
                    var nextRoom: String
                    nextRoom = String(currentRoom?.dropLast() ?? "Room1A")
                    if( roomDirection == "N"){ //If North, new scene will face South in the same room.
                        nextRoom +=  "S"
                    }
                    else{                       //If South, new scene will face North in the same room.
                        nextRoom += "N"
                    }
                    let secondScene = GameScene(fileNamed: nextRoom)
                    let transition = SKTransition.fade(withDuration: 0.45)
                    secondScene?.scaleMode = .aspectFill
                    scene?.view?.presentScene(secondScene!, transition: transition)
                }
            }
        }
    }
}
