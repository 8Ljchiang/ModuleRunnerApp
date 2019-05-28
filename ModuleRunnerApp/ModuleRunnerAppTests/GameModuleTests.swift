//
//  GameModuleTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class GameModuleTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

	func testInitGameModule() {
		let expectedText = "Default Input Response Here";
		let mockModuleRunner = MockModuleRunner(defaultInputResponse: expectedText);
		let mockCommandDispatcher = MockCommandDispatcher();
		
		let gameModule = GameModule(
			moduleRunner: mockModuleRunner,
			commandDispatcher: mockCommandDispatcher
		);
		
		XCTAssertNotNil(gameModule);
		XCTAssert(mockCommandDispatcher.isConnectModuleCalled);
		XCTAssertNotNil(mockCommandDispatcher.connectModuleCalledWith);
	}
	
	func testDisplay() {
		let expectedText = "Hello world!";
		let mockModuleRunner = MockModuleRunner(defaultInputResponse: "Default Input Response Here");
		let mockCommandDispatcher = MockCommandDispatcher();
		
		let gameModule = GameModule(
			moduleRunner: mockModuleRunner,
			commandDispatcher: mockCommandDispatcher
		);
		
		gameModule.display(expectedText);
		
		XCTAssert(mockModuleRunner.isDisplayCalled);
		XCTAssertEqual(mockModuleRunner.displayCalledWith, expectedText)
	}
	
	func testClearDisplay() {
		let expectedText = "Hello world!";
		let mockModuleRunner = MockModuleRunner(defaultInputResponse: "Default Input Response Here");
		let mockCommandDispatcher = MockCommandDispatcher();
		
		let gameModule = GameModule(
			moduleRunner: mockModuleRunner,
			commandDispatcher: mockCommandDispatcher
		);
		
		gameModule.clearDisplay();
		
		XCTAssert(mockModuleRunner.isClearDisplayCalled);
	}
	
	func testPromptForInput() {
		let expectedText = "Default Input Response Here";
		let mockModuleRunner = MockModuleRunner(defaultInputResponse: expectedText);
		let mockCommandDispatcher = MockCommandDispatcher();
		
		let gameModule = GameModule(
			moduleRunner: mockModuleRunner,
			commandDispatcher: mockCommandDispatcher
		);
		
		let responseInput = gameModule.promptForInput();
		
		XCTAssert(mockModuleRunner.isPromptForInputCalled);
		XCTAssertEqual(expectedText, responseInput);
	}
	
	func testStart() {
		let expectedText = "Default Input Response Here";
		let mockModuleRunner = MockModuleRunner(defaultInputResponse: expectedText);
		let mockCommandDispatcher = MockCommandDispatcher();
	
		let gameModule = GameModule(
			moduleRunner: mockModuleRunner,
			commandDispatcher: mockCommandDispatcher
		);
		
		gameModule.start(moduleRunner: mockModuleRunner);
		
		XCTAssertNotNil(gameModule.runner);
		XCTAssert(mockCommandDispatcher.isQueueCommandCalled);
		XCTAssertNotNil(mockCommandDispatcher.queueCommandCalledWith);
		XCTAssert(mockCommandDispatcher.isProcessQueueCalled);
	}
}
