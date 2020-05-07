//
//  Firebase.swift
//  AltruisMaze
//
//  Created by iphone on 5/6/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
//

import FirebaseFirestore

let firebaseSession = FirebaseSession()

class FirebaseSession : ObservableObject{
    let db = Firestore.firestore()
    
    init(){
        readData()
    }
    
    func readData() {
        db.collection("users").addSnapshotListener{ QuerySnapshot, error in
            guard let snapshot = QuerySnapshot else{
                print("Error fetching snapshots: \(error!)")
                return
            }
            snapshot.documentChanges.forEach{ diff in
                if (diff.type == .added){
                    print("New users")
                }
            
        }
        
    }
}
}
