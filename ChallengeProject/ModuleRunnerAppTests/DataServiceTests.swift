//
//  DataServiceTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class DataServiceTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testInitDataService() {
		let dataStore = DataStore();
		let dataService = DataService(dataStore: dataStore);
		
		XCTAssertNotNil(dataService);
	}
	
	func testGetStoreWhenDataServiceIsCreated() {
		var dataStore = DataStore();
		dataStore.data.updateValue(0, forKey: "activePlayerIndex");
		dataStore.data.updateValue([1, 2, 3], forKey: "moves");
		dataStore.data.updateValue(["P1", "P2"], forKey: "players");
		let dataService = DataService(dataStore: dataStore);
		
		let resultStore = dataService.getStore();

		XCTAssertNotNil(resultStore);
		XCTAssertEqual(dataStore.data.keys, resultStore.data.keys);
		XCTAssertEqual(dataStore.data.count, resultStore.data.count);
		XCTAssertEqual(dataStore.data["activePlayerIndex"] as! Int, resultStore.data["activePlayerIndex"] as! Int);
		XCTAssertEqual(dataStore.data["moves"] as! [Int], resultStore.data["moves"] as! [Int]);
		XCTAssertEqual(dataStore.data["players"] as! [String], resultStore.data["players"] as! [String]);
	}
	
	func testSetStore() {
		let expectedIndex = 0;
		let expectedMoves = [Move(playerId: "P1", position: 1, marker: MarkerType.Marker1.rawValue)];
		let expectedPlayers = ["P1", "P2"];
		
		var dataStore = DataStore();
		dataStore.data.updateValue(expectedIndex, forKey: "activePlayerIndex");
		dataStore.data.updateValue(expectedMoves, forKey: "moves");
		dataStore.data.updateValue(expectedPlayers, forKey: "players");
		
		let emptyStore = DataStore();
		let dataService = DataService(dataStore: emptyStore);
		
		dataService.setStore(store: dataStore);
		
		XCTAssertEqual(3, dataService.dataStore.data.count);
		XCTAssertEqual(expectedIndex, dataService.dataStore.data["activePlayerIndex"] as! Int);
		XCTAssertEqual(expectedMoves, dataService.dataStore.data["moves"] as! [Move]);
		XCTAssertEqual(expectedPlayers, dataService.dataStore.data["players"] as! [String]);
	}
	
	func testUpdateStore() {
		let initialStore = DataStore();
		
		let dataService = DataService(dataStore: initialStore);
		
		var partialData: [String: Any] = [
			"activePlayerIndex": 0,
			"moves": [1, 2, 3],
		];
		
		dataService.updateStore(partialData);
		
		XCTAssertEqual(partialData["activePlayerIndex"] as! Int, dataService.dataStore.data["activePlayerIndex"] as! Int);
		XCTAssertEqual(partialData["moves"] as! [Int], dataService.dataStore.data["moves"] as! [Int]);
	}
}
