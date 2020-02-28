//
//  AltruisMazeTests.swift
//  AltruisMazeTests
//
//  Created by Bomar, Shawn L on 2/23/20.
//  Copyright © 2020 Bomar-Pradhan. All rights reserved.
//

import XCTest
@testable import AltruisMaze

class AltruisMazeTests: XCTestCase {

    override func setUp() {
        
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testplayerLoadSucceeds() {
        let testgoodPlayer = Player.init(name: "Hagi", tradePoints: 5, altruismPoints: 2)
        XCTAssertNotNil(testgoodPlayer)
    }
    
    func testplayerDataBad(){
        let testbadPlayer = Player.init(name: "Reggie", tradePoints: -2, altruismPoints: 0)
        XCTAssertNil(testbadPlayer)
    }
    
    func testPlayerPointsGood(){
        let testGoodPlayer = Player.init(name: "Marco", tradePoints: 10, altruismPoints: 5)
        XCTAssertEqual(10, testGoodPlayer?.tradePoints)
    }
    
    func testPlayerPointsBad(){
        let testBadPlayer = Player.init(name: "Polo", tradePoints: 7, altruismPoints: 3)
        XCTAssertNotEqual(25, testBadPlayer?.altruismPoints)
    }
    
    func testPlayerLocationCheck(){
        let mappedPlayer = Player.init(name: "Not Lost", tradePoints: 0, altruismPoints: 0)
        XCTAssertTrue(mappedPlayer?.currentRoom == "1X", "Failed to Fetch Player's Current Location")
    }
    
    func testGoodKeyNaming(){
        let goodtestkey = DoorKey.init(color: "Green")
        XCTAssertTrue(goodtestkey.name == "Green Key", "Key failed to name itself correctly on initialization.")
    }
    
    func testBadKeyNaming(){
        let goodtestkey = DoorKey.init(color: "Red")
        XCTAssertFalse(goodtestkey.name == "Blue Key", "Key is sporting a correct name when it shouldn't.")
    }
    
    func testCipherTranslation(){
        let cipherTest = Cipher.init(input: "a message.")
        XCTAssertTrue(cipherTest.output == "Decoded Version of a message.", "Cipher did not properly assemble its output." )
    }
    
    func testPhotoDate(){
        let pictureTest = Photo.init(roomNumber: "1N")
        let dateToday = DateIntervalFormatter()
        dateToday.dateStyle = .short
        debugPrint(pictureTest.time)
        debugPrint(dateToday)
        XCTAssertTrue(pictureTest.time == dateToday)
    }
    
    func testPhotoLocation(){
        let picturetest = Photo.init(roomNumber: "1N")
        XCTAssertTrue(picturetest.location == "Room 1N")
    }
    
    

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
