//
//  CommandDispatcherTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class CommandDispatcherTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCommandDispatcher() {
		let commandDispatcher = CommandDispatcher();
		
		XCTAssertNotNil(commandDispatcher);
    }
	
	func testConnectModule() {
		let commandDispatcher = CommandDispatcher();
		let mockGameModule = MockGameModule();
		
		commandDispatcher.connectModule(gameModule: mockGameModule);
		
		XCTAssertNotNil(commandDispatcher.module);
	}
	
	func testQueueCommand() {
		let commandDispatcher = CommandDispatcher();
		
		let testCommand = Command(type: CommandType.T3Welcome, payload: "Welcome");
		
		commandDispatcher.queueCommand(testCommand);
		
		let resultCommandType = commandDispatcher.queue[0].type;
		
		XCTAssertEqual(1, commandDispatcher.queue.count);
		XCTAssertEqual(CommandType.T3Welcome, resultCommandType);
	}
}
