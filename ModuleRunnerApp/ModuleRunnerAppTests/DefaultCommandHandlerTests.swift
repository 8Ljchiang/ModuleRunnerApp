//
//  DefaultCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class DefaultCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitDefaultCommandHandler() {
		let defaultCH = DefaultCommandHandler();
		
		XCTAssertNotNil(defaultCH);
    }
	
	func testExecute() {
		let mockGameModule = MockGameModule();
		
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3Display, payload: payload);
		let defaultCH = DefaultCommandHandler();
		
		let response = defaultCH.execute(command, module: mockGameModule);
		let expectedCommandCount = 0;
		let expectedErrorsCount = 0;
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorsCount, response.errors.count);
	}
}
