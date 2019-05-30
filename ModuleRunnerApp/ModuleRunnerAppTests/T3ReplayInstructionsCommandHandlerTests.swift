//
//  T3ReplayInstructionsCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3ReplayInstructionsCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitT3ReplayInstructionsCommandHandler() {
		let replayCH = T3ReplayInstructionsCommandHandler();
		
		XCTAssertNotNil(replayCH);
    }
	
	func testExecute() {
		let replayCH = T3ReplayInstructionsCommandHandler();
		let payload: [String: Any] = [:];
		let replayCommand = Command(type: CommandType.T3ReplayInstructions, payload: payload);
		let expectedCommandCount = 2;
		let expectedErrorCount = 0;
		
		let response = replayCH.execute(replayCommand);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(CommandType.T3Display, response.commands[0]);
		XCTAssertEqual(T3Text.ReplayInstructions, response.commands[0].payload["text"]);
		XCTAssertEqual(CommandType.T3PromptForReplay, response.commands[1]);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
	}
}
