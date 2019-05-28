//
//  T3PromptForReplayCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3PromptForReplayCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitT3PromptForReplayCommandHandler() {
		let promptForReplayCH = T3PromptForReplayCommandHandler();
		
		XCTAssertNotNil(promptForReplayCH);
    }
	
	func testExecuteWhenInputIsReplay() {
		let inputText = "replay";
		let mockGameModule = MockGameModule(defaultInputResponse: inputText);
		let command = Command(type: CommandType.T3PromptForReplay, payload: [:]);
		let promptForReplayCH = T3PromptForReplayCommandHandler();
		
		let response = promptForReplayCH.execute(command, module: mockGameModule);
		let expectedCommandCount = 1;
		let expectedErrorCount = 0;
		
		XCTAssertNotNil(promptForReplayCH);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(CommandType.T3Welcome, response.commands[0].type);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
	}
	
	func testExecuteWhenInputIsNotReplay() {
		let inputText = "invalidInputAsdf";
		let mockGameModule = MockGameModule(defaultInputResponse: inputText);
		let command = Command(type: CommandType.T3PromptForReplay, payload: [:]);
		let promptForReplayCH = T3PromptForReplayCommandHandler();
		
		let response = promptForReplayCH.execute(command, module: mockGameModule);
		let expectedCommandCount = 0;
		let expectedErrorCount = 0;
		
		XCTAssertNotNil(promptForReplayCH);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
	}
}
