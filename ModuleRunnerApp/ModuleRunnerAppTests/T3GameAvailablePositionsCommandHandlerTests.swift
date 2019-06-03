//
//  T3GameAvailablePositionsCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 6/3/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3GameAvailablePositionsCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"playerCount": 2,
			"boardSize": 3,
			"aiSkill": 100,
			"moves": [],
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"winner": "P1",
		];
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let availablePositionsCH = T3GameAvailablePositionsCommandHandler(readDataService: mockReadDataService);
		
		XCTAssertNotNil(availablePositionsCH);
    }
}
