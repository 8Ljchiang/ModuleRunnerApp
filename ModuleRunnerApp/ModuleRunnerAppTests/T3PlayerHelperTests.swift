//
//  T3PlayerHelperTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3PlayerHelperTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testCycleActivePlayerIndex() {
		let currentActiveIndex = 1;
		let playerCount = 2;
		let expectedIndex = 2;
		
		let actualIndex = T3PlayerHelper.cycleActivePlayerIndex(currentIndex: currentActiveIndex, playerCount: playerCount);
		
		XCTAssertEqual(expectedIndex, actualIndex);
    }
}
