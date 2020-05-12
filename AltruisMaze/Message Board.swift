//
//  Message Board.swift
//  AltruisMaze
//
//  Created by iphone on 5/6/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
//

import SpriteKit
import GameplayKit
import Firebase
import FirebaseFirestore



class MessageBoard: SKScene{
      


    public var PreviousRoom: String = "Room 1N"
    override func didMove(to view: SKView) {
        backgroundColor = SKColor(red: 0.15, green:0.15, blue:0.3, alpha: 1.0)
        
        //Frame Measurements for Positioning
        let refX = self.frame.size.width, refY = self.frame.size.height
        
    
        //Banner
        let title = SKLabelNode()
        title.text = "Message Board"
        title.fontColor = UIColor.yellow
        title.fontSize = 76
        title.position = CGPoint(x: refX/2, y:refY - (refY/10))
        title.name = "title"
        self.addChild(title)
        
        //FromFirebasePhoto
        let photo = SKSpriteNode(imageNamed: "FBDL.png")
        photo.position = CGPoint(x: refX/2, y: refY/2)
        photo.size = CGSize(width: 1000, height: 500)
        photo.name = "photo"
        //self.addChild(photo)
        
        let refYM = refY - refY/9
        var refYCP = refYM - refY/20
        //print("hello",messagePosts)
        for message in messagePosts{
            let postname = SKLabelNode()
            postname.text = "Player: " + message["name"]!
            postname.fontColor = UIColor.white
            postname.fontSize = 64
            postname.position = CGPoint(x: refX/2, y: refYCP)
            postname.name = "name"
            refYCP -= refY/20
            
            let post = SKLabelNode()
            post.text = "Message: " + message["post"]!
            post.fontColor = UIColor.green
            post.fontSize = 64
            post.position = CGPoint(x: refX/2, y: refYCP)
            post.name = "post"
            refYCP -= refY/20
            self.addChild(postname)
            self.addChild(post)
            break
        }
    
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
