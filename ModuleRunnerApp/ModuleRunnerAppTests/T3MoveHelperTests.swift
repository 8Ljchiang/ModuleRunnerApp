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
		let actualScoreForMarker1 = T3MoveHelper.scoreMoves(currentMoves: currentMoves, currentPlayerMarker: MarkerType.Marker1.rawValue, iteration: 9, boardSize: 3);
		let actualScoreForMarker2 = T3MoveHelper.scoreMoves(currentMoves: currentMoves, currentPlayerMarker: MarkerType.Marker1.rawValue, iteration: 9, boardSize: 3);
		
		XCTAssertEqual(expectedScore, actualScoreForMarker1);
		XCTAssertEqual(expectedScore, actualScoreForMarker2);
	}
	
	func testScoreMovesWhenWin() {
		let playerId1 = "P1";
		let playerId2 = "P2";
		let currentMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 2, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 3, marker: MarkerType.Marker1.rawValue),
		];
		
		let currentIteration = 0;
		let expectedScore = 100;
		let actualScoreForMarker1 = T3MoveHelper.scoreMoves(currentMoves: currentMoves, currentPlayerMarker: MarkerType.Marker1.rawValue, iteration: currentIteration, boardSize: 3);
		
		XCTAssertEqual(expectedScore, actualScoreForMarker1);
	}
	
	func testScoreMovesWhenWinOnIteration2() {
		let playerId1 = "P1";
		let playerId2 = "P2";
		let currentMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 2, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 3, marker: MarkerType.Marker1.rawValue),
		];
		
		let currentIteration = 2;
		let expectedScore = 98;
		let actualScoreForMarker1 = T3MoveHelper.scoreMoves(currentMoves: currentMoves, currentPlayerMarker: MarkerType.Marker1.rawValue, iteration: currentIteration, boardSize: 3);
		
		XCTAssertEqual(expectedScore, actualScoreForMarker1);
	}
	
	func testScoreMovesWhenLoss() {
		let playerId1 = "P1";
		let playerId2 = "P2";
		let currentMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 2, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 3, marker: MarkerType.Marker1.rawValue),
		];
		
		let currentIteration = 1;
		let expectedScore = -99;
		let actualScoreForMarker1 = T3MoveHelper.scoreMoves(currentMoves: currentMoves, currentPlayerMarker: MarkerType.Marker1.rawValue, iteration: currentIteration, boardSize: 3);
		
		XCTAssertEqual(expectedScore, actualScoreForMarker1);
	}
	
	func testScoreMovesWhenLossOnIteration3() {
		let playerId1 = "P1";
		let playerId2 = "P2";
		let currentMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 2, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId2, position: 3, marker: MarkerType.Marker1.rawValue),
		];
		
		let currentIteration = 3;
		let expectedScore = -97;
		let actualScoreForMarker1 = T3MoveHelper.scoreMoves(currentMoves: currentMoves, currentPlayerMarker: MarkerType.Marker1.rawValue, iteration: currentIteration, boardSize: 3);
		
		XCTAssertEqual(expectedScore, actualScoreForMarker1);
	}
	
	func testGenerateSkilledMove() {
		let playerId1 = "P1";
		let boardSize = 3;
		let currentMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 2, marker: MarkerType.Marker1.rawValue),
		];
		
		let expectedMoves: [Move] = [
			Move(playerId: playerId1, position: 1, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 2, marker: MarkerType.Marker1.rawValue),
			Move(playerId: playerId1, position: 3, marker: MarkerType.Marker1.rawValue),
		];
		
		let actualMoves = T3MoveHelper.appendGeneratedSkilledMove(playerId: playerId1, marker: MarkerType.Marker1.rawValue, moves: currentMoves, boardSize: boardSize);
		
		XCTAssertEqual(expectedMoves, actualMoves);
	}
	
	func testGetHighestValuePosition() {
		let positionValues: [Int: Int] = [
			1: 10,
			2: 20,
			3: 30,
			4: -10,
		];
		
		let result = T3MoveHelper.getHighestValuePosition(positionValues);
		
		XCTAssertEqual(3, result.key);
		XCTAssertEqual(30, result.value);
	}
	
	func testGetLowestValuePosition() {
		let positionValues: [Int: Int] = [
			1: 10,
			2: 20,
			3: 30,
			4: -10,
		];
		
		let result = T3MoveHelper.getLowestValuePosition(positionValues);
		
		XCTAssertEqual(4, result.key);
		XCTAssertEqual(-10, result.value);
	}
}
