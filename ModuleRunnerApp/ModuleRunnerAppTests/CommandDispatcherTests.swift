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
		
		commandDispatcher.connectModule(gameModule: GameModuleProtocol);
		
		XCTAssertNotNil(commandDispatcher.module);
	}
}
