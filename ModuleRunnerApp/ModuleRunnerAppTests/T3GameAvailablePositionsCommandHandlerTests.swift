//
//  T3GameAvailablePositionsCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 6/3/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3GameAvailablePositionsCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"playerCount": 2,
			"boardSize": 3,
			"aiSkill": 100,
			"moves": [],
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"winner": "P1",
		];
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let availablePositionsCH = T3GameAvailablePositionsCommandHandler(readDataService: mockReadDataService);
		
		XCTAssertNotNil(availablePositionsCH);
    }
	
	func testExecute() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"playerCount": 2,
			"boardSize": 3,
			"aiSkill": 100,
			"moves": [],
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"winner": "P1",
		];
		let expectedPositionsString = "Available Positions: 1, 2, 3, 4, 5, 6, 7, 8, 9.";
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let mockGameModule = MockGameModule(defaultInputResponse: "Default input response");
		let availablePositionsCH = T3GameAvailablePositionsCommandHandler(readDataService: mockReadDataService);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameAvailablePositions, payload: payload);
		let expectedCommandCount = 2;
		let expectedErrorCount = 0;
		
		let response = availablePositionsCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		
		XCTAssertEqual(CommandType.T3Display, response.commands[0].type);
		XCTAssertEqual(expectedPositionsString, response.commands[0].payload["text"] as? String);
		XCTAssertEqual(CommandType.T3PromptForPosition, response.commands[1].type);
	}
	
	func testExecuteWhenSomeMovesExist() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"playerCount": 2,
			"boardSize": 3,
			"aiSkill": 100,
			"moves": [
				Move(playerId: "P1", position: 1, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 4, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 2, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 7, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 3, marker: MarkerType.Marker1.rawValue),
			],
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"winner": "P1",
		];
		let expectedPositionsString = "Available Positions: 5, 6, 8, 9.";
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let mockGameModule = MockGameModule(defaultInputResponse: "Default input response");
		let availablePositionsCH = T3GameAvailablePositionsCommandHandler(readDataService: mockReadDataService);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameAvailablePositions, payload: payload);
		let expectedCommandCount = 2;
		let expectedErrorCount = 0;
		
		let response = availablePositionsCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		
		XCTAssertEqual(CommandType.T3Display, response.commands[0].type);
		XCTAssertEqual(expectedPositionsString, response.commands[0].payload["text"] as? String);
		XCTAssertEqual(CommandType.T3PromptForPosition, response.commands[1].type);
	}
	
	func testExecuteWhenNoAvailablePositions() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"playerCount": 2,
			"boardSize": 3,
			"aiSkill": 100,
			"moves": [
				Move(playerId: "P1", position: 1, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 2, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 3, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 4, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 5, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 6, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 7, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P2", position: 8, marker: MarkerType.Marker2.rawValue),
				Move(playerId: "P1", position: 9, marker: MarkerType.Marker1.rawValue),
			],
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"winner": "P1",
		];
		let expectedPositionsString = "Available Positions: .";
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let mockGameModule = MockGameModule(defaultInputResponse: "Default input response");
		let availablePositionsCH = T3GameAvailablePositionsCommandHandler(readDataService: mockReadDataService);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameAvailablePositions, payload: payload);
		let expectedCommandCount = 1;
		let expectedErrorCount = 0;
		
		let response = availablePositionsCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		
		XCTAssertEqual(CommandType.T3Display, response.commands[0].type);
		XCTAssertEqual(expectedPositionsString, response.commands[0].payload["text"] as? String);
	}
	
	func testExecuteWhenNoMovesDataExists() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"playerCount": 2,
			"boardSize": 3,
			"aiSkill": 100,
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"winner": "P1",
		];
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let mockGameModule = MockGameModule(defaultInputResponse: "Default input response");
		let availablePositionsCH = T3GameAvailablePositionsCommandHandler(readDataService: mockReadDataService);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameAvailablePositions, payload: payload);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = availablePositionsCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		
		XCTAssertEqual("No moves data found.", response.errors[0]);
	}
	
	func testExecuteWhenNoBoardSizeDataExists() {
		var dataStore: DataStore = DataStore();
		dataStore.data = [
			"playerCount": 2,
			"moves": [],
			"aiSkill": 100,
			"players": ["P1", "P2"],
			"activePlayerIndex": 0,
			"winner": "P1",
		];
		let mockReadDataService = MockReadDataService(dataStore: dataStore);
		let mockGameModule = MockGameModule(defaultInputResponse: "Default input response");
		let availablePositionsCH = T3GameAvailablePositionsCommandHandler(readDataService: mockReadDataService);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameAvailablePositions, payload: payload);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = availablePositionsCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		
		XCTAssertEqual("No board size data found.", response.errors[0]);
	}
}
