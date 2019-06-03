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
		let expectedCommandCount = 3;
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
		XCTAssertEqual(CommandType.T3GameAvailablePositions, response.commands[2].type);
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
}
