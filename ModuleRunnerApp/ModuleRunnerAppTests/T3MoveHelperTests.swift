//
//  T3MoveHelperTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/29/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3MoveHelperTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGenerateMove() {
		let boardSize = 3;
		let playerId1 = "P1";
		let playerId2 = "P2";
		let moves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 2, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 3, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 4, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 5, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 6, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 7, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 8, marker: MarkerType.Marker2.rawValue),
		];
		
		let resultMove = T3MoveHelper.generateMove(playerId: playerId1, marker: MarkerType.Marker1.rawValue, moves: moves, boardSize: boardSize);
		
		XCTAssertNotNil(resultMove);
		XCTAssertEqual(playerId1, resultMove?.playerId);
		XCTAssertEqual(9, resultMove?.position);
		XCTAssertEqual(MarkerType.Marker1.rawValue, resultMove?.marker);
    }
}
