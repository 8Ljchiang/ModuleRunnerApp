//
//  T3GameEndInfoCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3GameEndInfoCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testInit() {
		let dataStore: DataStore = DataStore();
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let gameEndInfoCH = T3GameEndInfoCommandHandler(readDataService: mockReadDataService);
		
		XCTAssertNotNil(gameEndInfoCH);
	}
}