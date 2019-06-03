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
	
	func testExecute() {
		let inputPosition = "1";
		let mockGameModule = MockGameModule(defaultInputResponse: inputPosition);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3GameInfo, payload: payload);
		let mockDataStore = DataStore();
		let mockReadDataService = MockReadDataService(dataStore: mockDataStore)
		let promptForPositionCH = T3PromptForPositionCommandHandler(readDataService: mockReadDataService);
		let expectedCommandCount = 3;
		let expectedErrorCount = 0;
		
		let response = promptForPositionCH.execute(command, module: mockGameModule);

		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		XCTAssertEqual(CommandType.T3UpdateData, response.commands[0].type);
		XCTAssertEqual(2, response.commands[0].payload["moves"].count);
		XCTAssertTrue(response.commands[0].payload["moves"].contains { $0 == 1 })
		XCTAssertEqual(CommandType.T3GameInfo, response.commands[1].type);
		XCTAssertEqual(CommandType.T3GameAvailablePositions, response.commands[2].type);
	}
}
