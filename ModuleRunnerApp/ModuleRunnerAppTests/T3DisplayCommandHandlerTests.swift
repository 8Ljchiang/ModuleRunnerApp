//
//  DisplayCommandHandler.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/27/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3DisplayCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitDisplayCommandHandler() {
		let displayCH = T3DisplayCommandHandler();
		
		XCTAssertNotNil(displayCH);
    }
	
	func testExecute() {
		let expectedText = "Hello world!";
		let command = Command(type: CommandType.T3Dislpay, payload: expectedText);
		let displayCH = T3DisplayCommandHandler();
		let mockGameModule = MockGameModule(defaultInputResponse: "Default Input Response");
		
		let handlerResponse = displayCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(handlerResponse);
		XCTAssertEqual(0, handlerResponse.commands.count);
		XCTAssert(mockGameModule.isDisplayCalled);
		XCTAssertEqual(mockGameModule.displayCalledWith, expectedText);
	}
}
