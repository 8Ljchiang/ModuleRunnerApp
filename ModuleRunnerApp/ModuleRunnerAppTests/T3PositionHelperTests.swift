//
//  T3PositionHelperTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/29/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3PositionHelperTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testIsPositionAvailableWhenPositionTaken() {
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
			Move(playerId: playerId1, position: 9, marker: MarkerType.Marker1.rawValue)
		];
		
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 1, moves: moves, boardSize: boardSize));
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 2, moves: moves, boardSize: boardSize));
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 3, moves: moves, boardSize: boardSize));
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 4, moves: moves, boardSize: boardSize));
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 5, moves: moves, boardSize: boardSize));
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 6, moves: moves, boardSize: boardSize));
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 7, moves: moves, boardSize: boardSize));
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 8, moves: moves, boardSize: boardSize));
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 9, moves: moves, boardSize: boardSize));
    }
	
	func testIsPositionAvailableWhenPositionAvailable() {
		let boardSize = 3;
		let moves: [Move] = [];
		
		XCTAssertTrue(T3PositionHelper.isPositionAvailable(position: 1, moves: moves, boardSize: boardSize));
		XCTAssertTrue(T3PositionHelper.isPositionAvailable(position: 2, moves: moves, boardSize: boardSize));
		XCTAssertTrue(T3PositionHelper.isPositionAvailable(position: 3, moves: moves, boardSize: boardSize));
		XCTAssertTrue(T3PositionHelper.isPositionAvailable(position: 4, moves: moves, boardSize: boardSize));
		XCTAssertTrue(T3PositionHelper.isPositionAvailable(position: 5, moves: moves, boardSize: boardSize));
		XCTAssertTrue(T3PositionHelper.isPositionAvailable(position: 6, moves: moves, boardSize: boardSize));
		XCTAssertTrue(T3PositionHelper.isPositionAvailable(position: 7, moves: moves, boardSize: boardSize));
		XCTAssertTrue(T3PositionHelper.isPositionAvailable(position: 8, moves: moves, boardSize: boardSize));
		XCTAssertTrue(T3PositionHelper.isPositionAvailable(position: 9, moves: moves, boardSize: boardSize));
	}
	
	func testIsPositionAvailableWhenPositionLessThanOne() {
		let boardSize = 3;
		let moves: [Move] = [];
		
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 0, moves: moves, boardSize: boardSize));
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: -1, moves: moves, boardSize: boardSize));
	}
	
	func testIsPositionAvailableWhenPositionGreaterThanMaxPosition() {
		let boardSize = 3;
		let moves: [Move] = [];
		
		XCTAssertFalse(T3PositionHelper.isPositionAvailable(position: 10, moves: moves, boardSize: boardSize));
	}
	
	func testGetAvailablePositions() {
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
		];
		
		let expectedPositions = [7, 8, 9];
		
		XCTAssertEqual(expectedPositions, T3PositionHelper.getAvailablePositions(moves: moves, boardSize: boardSize));
	}
}
