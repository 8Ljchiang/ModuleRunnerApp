//
//  T3GameRulesCommandHandler.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3GameRulesCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitT3GameRulesCommandHandler() {
		let rulesCH = T3GameRulesCommandHandler();
		
		XCTAssertNotNil(rulesCH);
    }
	
	func testExecute() {
		let mockGameModule = MockGameModule(defaultInputResponse: "ready");
		let rulesPayload: [String: Any] = [:];
		let rulesCommand = Command(type: CommandType.T3Rules, payload: rulesPayload);
		let rulesCH = T3GameRulesCommandHandler();
		
		let response = rulesCH.execute(rulesCommand, module: mockGameModule);
		let expectedCommandCount = 3;
		let expectedErrorsCount = 0;
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(CommandType.T3Display, response.commands[0].type);
		XCTAssertEqual(T3Text.rules, response.commands[0].payload["text"] as! String);
		XCTAssertEqual(CommandType.T3Display, response.commands[1].type);
		XCTAssertEqual(T3Text.promptForReadyInstructions, response.commands[1].payload["text"] as! String);
		XCTAssertEqual(CommandType.T3PromptForReady, response.commands[2].type);
		XCTAssertEqual(expectedErrorsCount, response.errors.count);
	}
}
