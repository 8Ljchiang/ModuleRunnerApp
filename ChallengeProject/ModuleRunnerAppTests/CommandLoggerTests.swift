//
//  CommandLoggerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class CommandLoggerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCommandLogger() {
		let mockPresenterService = MockPresenterService();
		let commandLogger = CommandLogger(presenterService: mockPresenterService, isDisplayOn: false);
		
		XCTAssertNotNil(commandLogger);
    }
	
	func testLogCommand() {
		let mockPresenterService = MockPresenterService();
		let commandLogger = CommandLogger(presenterService: mockPresenterService, isDisplayOn: true);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3Welcome, payload: payload);
		
		commandLogger.logCommand(command);
		
		XCTAssert(mockPresenterService.isDisplayCalled);
		XCTAssertEqual("[CommandLogger]: T3Welcome", mockPresenterService.displayCalledWith);
	}
	
	func testLogCommandWhenIsDisplayOnIsFalse() {
		let mockPresenterService = MockPresenterService();
		let commandLogger = CommandLogger(presenterService: mockPresenterService, isDisplayOn: false);
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3Welcome, payload: payload);
		
		commandLogger.logCommand(command);
		
		XCTAssertFalse(mockPresenterService.isDisplayCalled);
	}
}
