//
//  T3PromptForReadyCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3PromptForReadyCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitPromptForReadyCommandHandler() {
		let promptForReadyCH = T3PromptForReadyCommandHandler();
		
		XCTAssertNotNil(promptForReadyCH);
    }
	
	func testExecuteWhenInputIsReady() {
		let mockGameModule = MockGameModule(defaultInputResponse: "ready");
		let promptForReadyPayload: [String: Any] = [:];
		let promptForReadyCommand = Command(type: CommandType.T3Rules, payload: promptForReadyPayload);
		let promptForReadyCH = T3PromptForReadyCommandHandler();
		
		let response = promptForReadyCH.execute(promptForReadyCommand, module: mockGameModule);
		let expectedCommandCount = 1;
		let expectedErrorsCount = 0;
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(CommandType.T3GameInfo, response.commands[0].type);
		XCTAssertEqual(expectedErrorsCount, response.errors.count);
	}
	
	func testExecuteWHenInputIsNotReady() {
		let inputText = "invalidTextAsdf";
		
		let mockGameModule = MockGameModule(defaultInputResponse: inputText);
		let promptForReadyPayload: [String: Any] = [:];
		let promptForReadyCommand = Command(type: CommandType.T3Rules, payload: promptForReadyPayload);
		let promptForReadyCH = T3PromptForReadyCommandHandler();
		
		let response = promptForReadyCH.execute(promptForReadyCommand, module: mockGameModule);
		let expectedCommandCount = 1;
		let expectedErrorsCount = 1;
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(CommandType.T3Welcome, response.commands[0].type);
		XCTAssertEqual(expectedErrorsCount, response.errors.count);
		XCTAssertEqual("Invalid input: " + inputText, response.errors[0]);
	}
}
