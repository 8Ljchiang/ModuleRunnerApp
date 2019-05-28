//
//  T3GameWelcomeCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3GameWelcomeCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitT3GameWelcomeCommandHandler() {
		let welcomeCH = T3GameWelcomeCommandHandler();
		
		XCTAssertNotNil(welcomeCH);
    }
	
	func testExecute() {
		let mockGameModule = MockGameModule(defaultInputResponse: "Default Input Response");
		let welcomeCH = T3GameWelcomeCommandHandler();
		let payload: [String: Any] = [:];
		let welcomeCommand = Command(type: CommandType.T3Welcome, payload: payload);
		
		let response = welcomeCH.execute(welcomeCommand, module: mockGameModule);
		
		XCTAssertNotNil(response);
		XCTAssertEqual(2, response.commands.count);
		XCTAssertEqual(CommandType.T3Display, response.commands[0].type);
		XCTAssertEqual(T3Text.Welcome, response.commands[0].payload["text"]);
		XCTAssertEqual(CommandType.T3Rules, response.commands[1].type);
		XCTAssertEqual(0, response.errors.count);
	}
}
