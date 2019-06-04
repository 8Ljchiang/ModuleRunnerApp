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
	
	func testGenerateMoveWhenNoAvailablePositions() {
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
			Move(playerId: playerId2, position: 9, marker: MarkerType.Marker2.rawValue)
		];
		
		let resultMove = T3MoveHelper.generateMove(playerId: playerId1, marker: MarkerType.Marker1.rawValue, moves: moves, boardSize: boardSize);
		
		XCTAssertNil(resultMove);
	}
	
	func testAppendMove() {
		let boardSize = 3;
		let playerId1 = "P1";
		let playerId2 = "P2";
		let initialMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 2, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 3, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 4, marker: MarkerType.Marker2.rawValue),
		];
		
		let expectedMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 2, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 3, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 4, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 5, marker: MarkerType.Marker1.rawValue)
		];
		
		let newMove = Move(playerId: playerId1, position: 5, marker: MarkerType.Marker1.rawValue);
		
		let resultMoves = T3MoveHelper.appendMove(newMove, moves: initialMoves, boardSize: boardSize);
		
		XCTAssertEqual(expectedMoves.count, resultMoves.count);
		XCTAssertEqual(expectedMoves, resultMoves);
	}
	
	func testAppendMoveWhenMaxMovesReached() {
		let boardSize = 3;
		let playerId1 = "P1";
		let playerId2 = "P2";
		let initialMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 2, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 3, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 4, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 5, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 6, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 7, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 8, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId2, position: 9, marker: MarkerType.Marker2.rawValue)
		];
		
		let expectedMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 2, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 3, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 4, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 5, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 6, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 7, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 8, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId2, position: 9, marker: MarkerType.Marker2.rawValue)
		];
		
		let newMove = Move(playerId: playerId1, position: 5, marker: MarkerType.Marker1.rawValue);
		
		let resultMoves = T3MoveHelper.appendMove(newMove, moves: initialMoves, boardSize: boardSize);
		
		XCTAssertEqual(expectedMoves.count, resultMoves.count);
		XCTAssertEqual(expectedMoves, resultMoves);
	}
	
	func testAppendGeneratedMove() {
		let boardSize = 3;
		let playerId1 = "P1";
		let playerId2 = "P2";
		let initialMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 2, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 3, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 4, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 5, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 6, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 7, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 8, marker: MarkerType.Marker2.rawValue),
		];
		
		let expectedMoves: [Move] = [
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
		
		let resultMoves = T3MoveHelper.appendGeneratedMove(playerId: playerId1, marker: MarkerType.Marker1.rawValue, moves: initialMoves, boardSize: boardSize);
		
		XCTAssertEqual(expectedMoves.count, resultMoves.count);
		XCTAssertEqual(expectedMoves, resultMoves);
	}
	
	func testScoreMovesWhenDraw() {
		let boardSize = 3;
		let playerId1 = "P1";
		let playerId2 = "P2";
		let currentMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 2, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 3, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId2, position: 4, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId2, position: 5, marker: MarkerType.Marker2.rawValue),
			Move(playerId: playerId1, position: 6, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 7, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 8, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 9, marker: MarkerType.Marker2.rawValue)
		];
		
		let expectedScore = 0;
		let actualScoreForMarker1 = T3MoveHelper.scoreMoves(currentMoves: currentMoves, currentPlayerMarker: MarkerType.Marker1.rawValue, iteration: 9);
		let actualScoreForMarker2 = T3MoveHelper.scoreMoves(currentMoves: currentMoves, currentPlayerMarker: MarkerType.Marker1.rawValue, iteration: 9);
		
		XCTAssertEqual(expectedScore, actualScoreForMarker1);
		XCTAssertEqual(expectedScore, actualScoreForMarker2);
	}
}
