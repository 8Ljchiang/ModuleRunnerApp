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
		let commandLogger = CommandLogger(presenterService: MockPresenterService, displayLog: false);
		
		XCTAssertNotNil(commandLogger);
    }
}
