//
//  T3PromptForPositionCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 6/3/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3PromptForPositionCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInit() {
		let mockDataStore = DataStore();
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		
		XCTAssertNotNil(promptForPositionCH);
    }
	
	func testExecuteWhenInputIsNotWinningMove() {
		let inputPosition = "1";
		let mockGameModule = MockGameModule(defaultInputResponse: inputPosition);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		var mockDataStore = DataStore();
		mockDataStore.data = [
			"moves": [],
			"activePlayerIndex": 0,
			"boardSize": 3,
			"players": ["P1", "P2"],
		];
		
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 2;
		let expectedErrorCount = 0;
		
		let response = promptForPositionCH.execute(command, module: mockGameModule);
		let updateCommandPayloadMoves = response.commands[0].payload["moves"] as? [Move];
		let updateCommandPayloadActivePlayerIndex = response.commands[0].payload["activePlayerIndex"] as? Int;
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual(CommandType.T3UpdateData, response.commands[0].type);
		XCTAssertEqual(0, updateCommandPayloadActivePlayerIndex);
		XCTAssertEqual(2, updateCommandPayloadMoves?.count);
		XCTAssertEqual(CommandType.T3GameInfo, response.commands[1].type);
//		XCTAssertEqual(CommandType.T3GameAvailablePositions, response.commands[2].type);
	}
	
	func testExecuteWhenInputIsWinningMove() {
		let inputPosition = "3";
		let mockGameModule = MockGameModule(defaultInputResponse: inputPosition);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		var mockDataStore = DataStore();
		mockDataStore.data = [
			"moves": [
				Move(playerId: "P1", position: 1, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 2, marker: MarkerType.Marker1.rawValue),
			],
			"activePlayerIndex": 0,
			"boardSize": 3,
			"players": ["P1", "P2"],
		];
		
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 2;
		let expectedErrorCount = 0;
		
		let response = promptForPositionCH.execute(command, module: mockGameModule);
		let updateCommandPayloadMoves = response.commands[0].payload["moves"] as? [Move];
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual(CommandType.T3UpdateData, response.commands[0].type);
		XCTAssertEqual(3, updateCommandPayloadMoves?.count);
		XCTAssertEqual(CommandType.T3GameEndInfo, response.commands[1].type);
	}
	
	func testExecuteWhenAllMovesTaken() {
		let inputPosition = "3";
		let mockGameModule = MockGameModule(defaultInputResponse: inputPosition);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		var mockDataStore = DataStore();
		mockDataStore.data = [
			"moves": [
				Move(playerId: "P1", position: 1, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 2, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 3, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 4, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 5, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 6, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 7, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 8, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 9, marker: MarkerType.Marker1.rawValue),
			],
			"activePlayerIndex": 0,
			"boardSize": 3,
			"players": ["P1", "P2"],
		];
		
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 2;
		let expectedErrorCount = 0;
		
		let response = promptForPositionCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual(CommandType.T3UpdateData, response.commands[0].type);
		XCTAssertEqual("No one", response.commands[0].payload["winner"] as? String);
		XCTAssertEqual(CommandType.T3GameEndInfo, response.commands[1].type);
	}
	
	func testExecuteWhenInputIsInvalid() {
		let inputPosition = "InvalidInputASDF";
		let mockGameModule = MockGameModule(defaultInputResponse: inputPosition);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		var mockDataStore = DataStore();
		mockDataStore.data = [
			"moves": [
				Move(playerId: "P1", position: 1, marker: MarkerType.Marker1.rawValue),
				Move(playerId: "P1", position: 2, marker: MarkerType.Marker1.rawValue),
			],
			"activePlayerIndex": 0,
			"boardSize": 3,
			"players": ["P1", "P2"],
		];
		
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 1;
		let expectedErrorCount = 1;
		
		let response = promptForPositionCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual("Invalid position: \(inputPosition)", response.errors[0]);
		XCTAssertEqual(CommandType.T3GameInfo, response.commands[0].type);
//		XCTAssertEqual(CommandType.T3GameAvailablePositions, response.commands[1].type);
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
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = promptForPositionCH.execute(command, module: mockGameModule);
		
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
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = promptForPositionCH.execute(command, module: mockGameModule);
		
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
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = promptForPositionCH.execute(command, module: mockGameModule);
		
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
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 0;
		let expectedErrorCount = 1;
		
		let response = promptForPositionCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual("No player data found.", response.errors[0]);
	}
}
