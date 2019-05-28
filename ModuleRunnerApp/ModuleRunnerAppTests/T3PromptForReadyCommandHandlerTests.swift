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
		let expectedCommandCount = 2;
		let expectedErrorsCount = 0;
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(CommandType.T3Display, response.commands[0].type);
		XCTAssertEqual(T3Text.promptForReadyInstructions, response.commands[0].payload["text"] as! String);
		XCTAssertEqual(CommandType.T3GameInfo, response.commands[1].type);
		XCTAssertEqual(expectedErrorsCount, response.errors.count);
	}
}
