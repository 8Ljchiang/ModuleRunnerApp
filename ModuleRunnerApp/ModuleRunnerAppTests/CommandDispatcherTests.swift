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
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver);
		
		XCTAssertNotNil(commandDispatcher);
    }
	
	func testConnectModule() {
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver);
		let mockGameModule = MockGameModule();
		
		commandDispatcher.connectModule(gameModule: mockGameModule);
		
		XCTAssertNotNil(commandDispatcher.module);
	}
	
	func testQueueCommand() {
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver);
		
		let testCommand = Command(type: CommandType.T3Welcome, payload: "Welcome");
		
		commandDispatcher.queueCommand(testCommand);
		
		let resultCommandType = commandDispatcher.queue[0].type;
		
		XCTAssertEqual(1, commandDispatcher.queue.count);
		XCTAssertEqual(CommandType.T3Welcome, resultCommandType);
	}
	
	func testQueueCommandWithMultiple() {
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver);
		
		let testCommand1 = Command(type: CommandType.T3Welcome, payload: "Welcome");
		let testCommand2 = Command(type: CommandType.T3Rules, payload: "Rules");
		
		commandDispatcher.queueCommand(testCommand1);
		commandDispatcher.queueCommand(testCommand2);
		
		XCTAssertEqual(2, commandDispatcher.queue.count);
		
		let resultCommandType1 = commandDispatcher.queue[0].type;
		let resultCommandType2 = commandDispatcher.queue[1].type;
		
		XCTAssertEqual(CommandType.T3Welcome, resultCommandType1);
		XCTAssertEqual(CommandType.T3Rules, resultCommandType2);
	}
	
	func testProcessQueue() {
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver);
		
		let testCommand1 = Command(type: CommandType.T3Welcome, payload: "Welcome");
		let testCommand2 = Command(type: CommandType.T3Rules, payload: "Rules");
		
		commandDispatcher.queueCommand(testCommand1);
		commandDispatcher.queueCommand(testCommand2);
		
		commandDispatcher.processQueue();
		
		XCTAssertEqual(0, commandDispatcher.queue.count);
	}
	
	func testProcessQueueCallsToCommandHandlerResolver() {
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver);
		
		let testCommand1 = Command(type: CommandType.T3Welcome, payload: "Welcome");
		let testCommand2 = Command(type: CommandType.T3Rules, payload: "Rules");
		
		commandDispatcher.queueCommand(testCommand1);
		commandDispatcher.queueCommand(testCommand2);
		
		commandDispatcher.processQueue();
		
		let expectedCallCount = 2;
		
		XCTAssertEqual(expectedCallCount, mockCommandHandlerResolver.getHandlerCallCount);
	}
}