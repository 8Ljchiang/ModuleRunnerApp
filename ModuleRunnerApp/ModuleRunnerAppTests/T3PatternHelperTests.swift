//
//  T3PatternHelperTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3PatternHelperTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRowPatterns() {
		let boardSize = 3;
		let expectedRowPatterns: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
		
		let rowPatterns = T3PatternHelper.getRowPatterns(boardSize: boardSize);
		
		XCTAssertEqual(expectedRowPatterns, rowPatterns):
    }
}
