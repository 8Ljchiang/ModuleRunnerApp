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
	
	func testExecuteWhenWinnerExists() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"boardSize": 3,
			"playerCount": 2,
			"aiSkill": 100,
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"moves": [
				Move(playerId: "P1", position: 1, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 4, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 2, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 7, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 3, marker: MarkerType.Marker1.rawValue),
			],
			"winner": "P1",
			"winningPattern": [1, 2, 3]
		];
		let expectedBoardString = "         |         |         \n    X    |    X    |    X    \n         |         |         \n-----------------------------\n         |         |         \n    O    |         |         \n         |         |         \n-----------------------------\n         |         |         \n    O    |         |         \n         |         |         \n";
		let expectedEndInfoString = "The game is over.\nP1 is the winner.\nWinning Pattern: 1, 2, 3.\n";
		let mockGameModule = MockGameModule(defaultInputResponse: "Default input response");
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameEndInfo, payload: payload);
		let gameEndInfoCH = T3GameEndInfoCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 4;
		let expectedErrorCount = 0;
		
		let response = gameEndInfoCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(CommandType.T3Display, response.commands[0].type);
		XCTAssertEqual(T3Text.title, response.commands[0].payload["text"] as? String);
		XCTAssertEqual(CommandType.T3Display, response.commands[1].type);
		XCTAssertEqual(expectedBoardString, response.commands[1].payload["text"] as? String);
		XCTAssertEqual(CommandType.T3Display, response.commands[2].type);
		XCTAssertEqual(expectedEndInfoString, response.commands[2].payload["text"] as? String);
		XCTAssertEqual(CommandType.T3ReplayInstructions, response.commands[3].type);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
	}
	
	func testExecuteWhenNoMovesExist() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"boardSize": 3,
			"playerCount": 2,
			"aiSkill": 100,
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"winner": "P1",
			"winningPattern": [1, 2, 3]
		];
		
		let mockGameModule = MockGameModule(defaultInputResponse: "Default input response");
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameEndInfo, payload: payload);
		let gameEndInfoCH = T3GameEndInfoCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 1;
		let expectedErrorCount = 1;
		
		let response = gameEndInfoCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(CommandType.T3Display, response.commands[0].type);
		XCTAssertEqual(T3Text.title, response.commands[0].payload["text"] as? String);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual("No moves data found.", response.errors[0]);
	}
}
