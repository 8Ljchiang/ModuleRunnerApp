//
//  T3GameInfoCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 6/3/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3GameInfoCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() {
		let dataStore = DataStore();
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let gameInfoCH = T3GameInfoCommandHandler(readDataService: mockReadDataService);
		
		XCTAssertNotNil(gameInfoCH);
    }
	
	func testExecute() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"boardSize": 3,
//			"playerCount": 1,
//			"aiSkill": 100,
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"moves": [
				Move(playerId: "P1", position: 1, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 4, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 2, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 7, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 3, marker: MarkerType.Marker1.rawValue),
			],
//			"winner": "P1",
//			"winningPattern": [1, 2, 3]
		];
		let expectedBoardString = "         |         |         \n    X    |    X    |    X    \n         |         |         \n-----------------------------\n         |         |         \n    O    |         |         \n         |         |         \n-----------------------------\n         |         |         \n    O    |         |         \n         |         |         \n";
		let expectedInfoString = "\nP1's turn. Select a position.";
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let mockGameModule = MockGameModule(defaultInputResponse: "default input response");
		let gameInfoCH = T3GameInfoCommandHandler(readDataService: mockReadDataService);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		let expectedCommandCount = 4;
		let expectedErrorCount = 0;
		
		let response = gameInfoCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual(CommandType.T3Display, response.commands[0].type);
		XCTAssertEqual(T3Text.title, response.commands[0].payload["text"] as? String);
		XCTAssertEqual(CommandType.T3Display, response.commands[1].type);
		XCTAssertEqual(expectedBoardString, response.commands[1].payload["text"] as? String);
		XCTAssertEqual(CommandType.T3Display, response.commands[2].type);
		XCTAssertEqual(expectedInfoString, response.commands[2].payload["text"] as? String);
		XCTAssertEqual(CommandType.T3GameAvailablePositions, response.commands[3].type);
	}
	
	func testExecuteWhenNoMovesDataExists() {
		let inputPosition = "3";
		let mockGameModule = MockGameModule(defaultInputResponse: inputPosition);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		var mockDataStore = DataStore();
		mockDataStore.data = [
			"activePlayerIndex": 0,
			"boardSize": 3,
			"players": ["P1", "P2"],
		];
		
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let gameInfoCH = T3GameInfoCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = gameInfoCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual("No moves data found.", response.errors[0]);
	}
	
	func testExecuteWhenNoBoardSizeData() {
		let inputPosition = "3";
		let mockGameModule = MockGameModule(defaultInputResponse: inputPosition);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		var mockDataStore = DataStore();
		mockDataStore.data = [
			"moves": [],
			"activePlayerIndex": 0,
			"players": ["P1", "P2"],
		];
		
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let gameInfoCH = T3GameInfoCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = gameInfoCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual("No board size data found.", response.errors[0]);
	}
	
	func testExecuteWhenNoActivePlayerIndexData() {
		let inputPosition = "3";
		let mockGameModule = MockGameModule(defaultInputResponse: inputPosition);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		var mockDataStore = DataStore();
		mockDataStore.data = [
			"moves": [],
			"boardSize": 3,
			"players": ["P1", "P2"],
		];
		
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let gameInfoCH = T3GameInfoCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = gameInfoCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual("No active player index data found.", response.errors[0]);
	}
	
	func testExecuteWhenNoPlayerData() {
		let inputPosition = "3";
		let mockGameModule = MockGameModule(defaultInputResponse: inputPosition);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		var mockDataStore = DataStore();
		mockDataStore.data = [
			"moves": [],
			"boardSize": 3,
			"activePlayerIndex": 0,
		];
		
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let gameInfoCH = T3GameInfoCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = gameInfoCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual("No player data found.", response.errors[0]);
	}
}
