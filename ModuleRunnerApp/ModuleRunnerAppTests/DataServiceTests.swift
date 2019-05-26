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
		let dataService = DataService();
		
		XCTAssertNotNil(dataService);
	}
	
	func testGetStoreWhenDataServiceIsCreated() {
		let dataService = DataService();

		let expectedStore = DataStore();
		
		let storeData = dataService.getStore();

		XCTAssertEqual(expectedStore.activePlayerIndex, storeData.activePlayerIndex);
		XCTAssertEqual(expectedStore.players.isEmpty, storeData.players.isEmpty);
		XCTAssertEqual(expectedStore.players.count, storeData.players.count);
		XCTAssertEqual(expectedStore.moves.count, storeData.moves.count);
		XCTAssertEqual(expectedStore.moves.isEmpty, storeData.moves.isEmpty);
	}
	
	func testSetStore() {
		let dataService = DataService();
		
		var newStore = DataStore();
		newStore.activePlayerIndex = 1;
		newStore.players = ["P1", "P2"];
		newStore.moves = [1, 2, 3];
		
		dataService.setStore(store: newStore);
		
//		let storeData = dataService.getStore();
		
		XCTAssertEqual(newStore, dataService.dataStore);
	}
	
	func testUpdateStore() {
		let dataService = DataService();
		
		var newStore = DataStore();
		newStore.activePlayerIndex = 1;
		newStore.moves = [1, 2, 3];
		
		dataService.updateStore(store: newStore);
		
		XCTAssertEqual(newStore.activePlayerIndex, dataService.dataStore.activePlayerIndex)
		XCTAssertEqual(0, dataService.dataStore.players.count)
		XCTAssertEqual(newStore.moves.count, dataService.dataStore.moves.count)
	}
	
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
