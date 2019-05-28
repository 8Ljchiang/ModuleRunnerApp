//
//  CommandHandlerResolverTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class CommandHandlerResolverTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitCommandHandlerResolver() {
		let commandHandlerResolver = CommandHandlerResolver();
		
		XCTAssertNotNil(commandHandlerResolver);
    }
	
	func testAddHandler() {
		let commandHandlerResolver = CommandHandlerResolver();
		
		commandHandlerResolver.addHandler(
			type: CommandType.T3Display,
			commandHandler: T3DisplayCommandHandler());
		
		XCTAssert(commandHandlerResolver.handlersMap.keys.contains(CommandType.T3Display));
	}
	
	func testGetHandler() {
		let commandHandlerResolver = CommandHandlerResolver();
		
		commandHandlerResolver.addHandler(
			type: CommandType.T3Display,
			commandHandler: T3DisplayCommandHandler());
		
		let handler = commandHandlerResolver.getHandler(CommandType.T3Display);
		
		let expectedStringType = "ModuleRunnerAppTests.T3DisplayCommandHandler";
		let objectMetaType = type(of: handler);
		let actualStringType = String(reflecting: objectMetaType);
		
		XCTAssertNotNil(handler);
		XCTAssertEqual(expectedStringType, actualStringType);
	}
}
