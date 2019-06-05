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
		let mockCommandLogger = MockCommandLogger();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver, commandLogger: mockCommandLogger);
		
		XCTAssertNotNil(commandDispatcher);
    }
	
	func testConnectModule() {
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let mockCommandLogger = MockCommandLogger();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver, commandLogger: mockCommandLogger);
		let mockGameModule = MockGameModule();
		
		commandDispatcher.connectModule(gameModule: mockGameModule);
		
		XCTAssertNotNil(commandDispatcher.module);
	}
	
	func testQueueCommand() {
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let mockCommandLogger = MockCommandLogger();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver, commandLogger: mockCommandLogger);
		let payload = ["message": "Welcome"];
		let testCommand = Command(type: CommandType.T3Welcome, payload: payload);
		
		commandDispatcher.queueCommand(testCommand);
		
		let resultCommandType = commandDispatcher.queue[0].type;
		
		XCTAssertEqual(1, commandDispatcher.queue.count);
		XCTAssertEqual(CommandType.T3Welcome, resultCommandType);
	}
	
	func testQueueCommandWithMultiple() {
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let mockCommandLogger = MockCommandLogger();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver, commandLogger: mockCommandLogger);
		let payload1 = ["message": "Welcome"];
		let payload2 = ["message": "Rules"];
		let testCommand1 = Command(type: CommandType.T3Welcome, payload: payload1);
		let testCommand2 = Command(type: CommandType.T3Rules, payload: payload2);
		
		commandDispatcher.queueCommand(testCommand1);
		commandDispatcher.queueCommand(testCommand2);
		
		XCTAssertEqual(2, commandDispatcher.queue.count);
		
		let resultCommandType1 = commandDispatcher.queue[0].type;
		let resultCommandType2 = commandDispatcher.queue[1].type;
		
		XCTAssertEqual(CommandType.T3Welcome, resultCommandType1);
		XCTAssertEqual(CommandType.T3Rules, resultCommandType2);
	}
	
	func testProcessQueue() {
		let mockGameModule = MockGameModule();
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let mockCommandLogger = MockCommandLogger();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver, commandLogger: mockCommandLogger);
		commandDispatcher.connectModule(gameModule: mockGameModule);
		let payload1 = ["text": "Welcome"];
		let payload2 = ["text": "Rules"];
		let testCommand1 = Command(type: CommandType.T3Welcome, payload: payload1);
		let testCommand2 = Command(type: CommandType.T3Rules, payload: payload2);
		
		commandDispatcher.queueCommand(testCommand1);
		commandDispatcher.queueCommand(testCommand2);
		
		commandDispatcher.processQueue();
		
		XCTAssertEqual(0, commandDispatcher.queue.count);
		XCTAssert(mockCommandLogger.isLogCommandCalled);
	}
	
	func testProcessQueueCallsToCommandHandlerResolver() {
		let mockCommandHandlerResolver = MockCommandHandlerResolver();
		let mockGameModule = MockGameModule();
		let mockCommandLogger = MockCommandLogger();
		let commandDispatcher = CommandDispatcher(resolver: mockCommandHandlerResolver, commandLogger: mockCommandLogger);
		commandDispatcher.connectModule(gameModule: mockGameModule);
		let payload1 = ["text": "Welcome"];
		let payload2 = ["text": "Rules"];
		let testCommand1 = Command(type: CommandType.T3Welcome, payload: payload1);
		let testCommand2 = Command(type: CommandType.T3Rules, payload: payload2);
		
		commandDispatcher.queueCommand(testCommand1);
		commandDispatcher.queueCommand(testCommand2);
		
		commandDispatcher.processQueue();
		
		let expectedCallCount = 2;
		
		XCTAssertEqual(expectedCallCount, mockCommandHandlerResolver.getHandlerCallCount);
	}
}
