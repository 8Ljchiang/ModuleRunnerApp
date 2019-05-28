//
//  T3DisplayClearCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3DisplayClearCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitT3DisplayClearCommandHandler() {
		let displayClearCH = T3DisplayClearCommandHandler();
		
		XCTAssertNotNil(displayClearCH);
    }
	
	func testExecute() {
		let mockGameModule = MockGameModule(defaultInputResponse: "Default input response");
		let displayClearCH = T3DisplayClearCommandHandler();
		let displayClearPayload: [String: Any] = [:];
		let displayClearCommand = Command(type: CommandType.T3DisplayClear, payload: displayClearPayload);
		
		let response = displayClearCH.execute(displayClearCommand, module: mockGameModule);
		let expectedCommandCount = 0;
		let expectedErrorCount = 0;
		
		XCTAssertNotNil(response);
		XCTAssertEqual(expectedCommandCount, response.commands.count);
		XCTAssertEqual(expectedErrorCount, response.errors.count);
		
		XCTAssert(mockGameModule.isClearDisplayCalled);
	}
}
