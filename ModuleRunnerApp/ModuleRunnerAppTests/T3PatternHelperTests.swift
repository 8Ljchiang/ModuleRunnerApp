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

    func testGetRowPatterns() {
		let boardSize = 3;
		let expectedRowPatterns: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9]];
		
		let rowPatterns = T3PatternHelper.getRowPatterns(boardSize: boardSize);
		
		XCTAssertEqual(expectedRowPatterns, rowPatterns);
    }
	
	func testGetColumnPatterns() {
		let boardSize = 3;
		let expectedColumnPatterns: [[Int]] = [[1, 4, 7], [2, 5, 8], [3, 6, 9]];
		
		let columnPatterns = T3PatternHelper.getColumnPatterns(boardSize: boardSize);
		
		XCTAssertEqual(expectedColumnPatterns, columnPatterns);
	}
	
	func getDiagonalPatterns() {
		let boardSize = 3;
		let expectedHorizontalPatterns: [[Int]] = [[1, 5, 9], [3, 5, 7]];
		
		let horizontalPatterns = T3PatternHelper.getDiagonalPatterns(boardSize: boardSize);
		
		XCTAssertEqual(expectedHorizontalPatterns, horizontalPatterns);
	}
	
	func getWinningPatterns() {
		let boardSize = 3;
		let expectedPatterns: [[Int]] = [[1, 2, 3], [4, 5, 6], [7, 8, 9], [1, 4, 7], [2, 5, 8], [3, 6, 9], [1, 5, 9], [3, 5, 7]];
		
		let actualPatterns = T3PatternHelper.getWinningPatterns(boardSize: boardSize);
		
		XCTAssertEqual(expectedPatterns, actualPatterns);
	}
}
