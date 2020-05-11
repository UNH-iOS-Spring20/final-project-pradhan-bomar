//
//  GameViewController.swift
//  AltruisMaze
//
//  Created by Bomar, Shawn L on 2/23/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
//

import UIKit
import SpriteKit
import GameplayKit
import Firebase
import FirebaseFirestore
import FirebaseDatabase


// The entire class can use the database
let db = Firestore.firestore()
var messagePosts: [[String: String]] = []
class GameViewController: UIViewController {
// create buttons for delete, collect data from teh collection in Firebase
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //db.collection("posts").addDocument(data: ["name":"T", "post":"Can anyone help me with a Green key?"])
        //db.collection("posts").addDocument(data: ["name":"Q", "post":"Does anyone have decyrpted key for Red door?"])

    
        let postsRef = db.collection("posts")

        postsRef.document("Q").setData([
            "name": "Q",
            "post": "Hi. I'm trying to find a key to a Green door. Could anyone please help me?"
            ])
        postsRef.document("T").setData([
            "name": "T",
            "post": "I have a decrypted password for Red Door. Is anyone willing to exchange it for Red key?"
                ])
        postsRef.document("Z").setData([
            "name": "H",
            "post": "Hey Q. I have a Green key that I could give to you."           ])
        postsRef.document("Q1").setData([
            "name": "Q",
            "post": "Thanks H!"
                     ])
      
       
        
        db.collection("posts").getDocuments() { (querySnapshot, err) in
            if let err = err {
                print("Error getting documents: \(err)")
            } else {
                for document in querySnapshot!.documents {
                    messagePosts.append(document.data() as! [String : String])
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    // Load 'GameScene.sks' as a GKScene. This provides gameplay related content
        // including entities and graphs.
        // Loaded scene should retrieve data from Firebase to resume game where player left off. 
        if let scene = GKScene(fileNamed: "Room 1N") {
            
            // Get the SKScene from the loaded GKScene
            if let sceneNode = scene.rootNode as! GameScene? {
                
                // Copy gameplay related content over to the scene
                sceneNode.entities = scene.entities
                sceneNode.graphs = scene.graphs
                
                // Set the scale mode to scale to fit the window
                sceneNode.scaleMode = .aspectFill
                
                // Present the scene
                if let view = self.view as! SKView? {
                    view.presentScene(sceneNode)
                    
                    view.ignoresSiblingOrder = true
                    
                    view.showsFPS = true
                    view.showsNodeCount = true
                }
            }
        }
    }
    
    
    // Adding data into Firbase, has to be triggered for this to work. Use button
    private func createUsers(){
        let usersRef = db.collection("users")
        usersRef.document().setData([
            "name" : "R"
        ])
        
        usersRef.document().setData([
            "name" : "T"
        ])
        
        usersRef.document().setData([
            "name" : "K"
        ])
    }
    
    //update the Firebase
    private func updateUsers(){
         let usersRef = db.collection("users")
         usersRef.document().setData([
             "name" : "R"
         ])
         
         usersRef.document().setData([
             "name" : "T"
         ])
         
         usersRef.document().setData([
             "name" : "K"
         ])
     }
    
    // Get data from the Firebase
    private func getCollection(collection: String){
        db.collection("users").getDocuments() {
            (QuerySnapshot, err) in
            if let err = err {
                print("Error getting document: \(err)")
            } else {
                for document in QuerySnapshot!.documents {
                    print("\(document.documentID) => \(document.data())")
                }
            }
        }
    }
// Deletes entire collection
    // Use this with care, not used in Production Mode
    private func deleteCollection(collection: String){
        db.collection(collection).getDocuments() { (QuerySnapshot, err) in
            if let err = err {
                print("Error getting documents : \(err)")
            } else{
                for document in QuerySnapshot!.documents {
                    print("Deleting \(document.documentID) => \(document.data())")
                    document.reference.delete()
                }
                
            }
        }
    }
    
    func rotation(){
        
    }
    
    
    func navigationControllerSupportedInterfaceOrientations(_ navigationController: UINavigationController) -> UIInterfaceOrientationMask {
        return UIInterfaceOrientationMask.landscape
    }
    

    override var shouldAutorotate: Bool {
        return true
    }

    override var supportedInterfaceOrientations: UIInterfaceOrientationMask {
        if UIDevice.current.userInterfaceIdiom == .phone {
            return .allButUpsideDown
        } else {
            return .all
        }
    }

    override var prefersStatusBarHidden: Bool {
        return true
    }
}
