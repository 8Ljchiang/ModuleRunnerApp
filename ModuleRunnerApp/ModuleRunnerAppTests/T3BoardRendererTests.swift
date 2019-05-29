//
//  BoardRendererTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3BoardRendererTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testRenderBoardWhenZeroMoves() {
		let expectedString = "         |         |         \n         |         |         \n         |         |         \n-----------------------------\n         |         |         \n         |         |         \n         |         |         \n-----------------------------\n         |         |         \n         |         |         \n         |         |         \n";
		let moves: [Move] = [];
		let boardSize = 3;
		let boardString = T3BoardRenderer.render(moves, boardSize: boardSize);
		
		XCTAssertEqual(expectedString, boardString);
    }
	
	func testRenderBoardWhenOneMove() {
		let expectedString = "         |         |         \n    \(MarkerType.Marker1.rawValue)    |         |         \n         |         |         \n-----------------------------\n         |         |         \n         |         |         \n         |         |         \n-----------------------------\n         |         |         \n         |         |         \n         |         |         \n";
		
		let playerId1 = "P1";
		let moves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
		];
		let boardSize = 3;
		let boardString = T3BoardRenderer.render(moves, boardSize: boardSize);
		
		XCTAssertEqual(expectedString, boardString);
	}
	
	func testRenderBoardWhenFullMoves() {
		let expectedString = "         |         |         \n    \(MarkerType.Marker1.rawValue)    |    \(MarkerType.Marker2.rawValue)    |    \(MarkerType.Marker1.rawValue)    \n         |         |         \n-----------------------------\n         |         |         \n    \(MarkerType.Marker2.rawValue)    |    \(MarkerType.Marker1.rawValue)    |    \(MarkerType.Marker2.rawValue)    \n         |         |         \n-----------------------------\n         |         |         \n    \(MarkerType.Marker1.rawValue)    |    \(MarkerType.Marker2.rawValue)    |    \(MarkerType.Marker1.rawValue)    \n         |         |         \n";
		
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
		let boardSize = 3;
		let boardString = T3BoardRenderer.render(moves, boardSize: boardSize);
		
		XCTAssertEqual(expectedString, boardString);
	}
}
