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
		let gameModule = GameModule();
		
		XCTAssertNotNil(gameModule);
	}
	
	func testDisplay() {
		let expectedText = "Hello world!";
		let mockModuleRunner = MockModuleRunner();
		
		let gameModule = GameModule(moduleRunner: mockModuleRunner);
		
		gameModule.display(expectedText);
		
		XCTAssert(mockModuleRunner.isDisplayCalled);
		XCTAssertEqual(mockModuleRunner.displayCalledWith, expectedText)
	}
}
