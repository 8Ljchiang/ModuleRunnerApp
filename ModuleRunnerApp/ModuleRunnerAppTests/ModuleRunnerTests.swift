//
//  ModuleRunnerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class ModuleRunnerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitModuleRunner() {
		let mockPresenterService = MockPresenterService();
		
		let mRunner = ModuleRunner(presenterService: mockPresenterService);
		
		XCTAssertNotNil(mRunner);
    }
	
	func testDisplay() {
		let mockPresenterService = MockPresenterService();
		
		let mRunner = ModuleRunner(presenterService: mockPresenterService);
		
		let expectedText = "Hello world!";
		
		mRunner.display(expectedText);
		
		XCTAssert(mockPresenterService.isDisplayCalled);
		XCTAssertEqual(mockPresenterService.displayCalledWith, expectedText);
	}
	
	func testPromptForInput() {
		let expectedText = "Yes";
		
		let mockPresenterService = MockPresenterService();
		let mockInputService = MockInputService(inputResponse: expectedText);
		
		let mRunner = ModuleRunner(
			presenterService: mockPresenterService,
			inputService: mockInputService
		);
		
		let actualInput = mRunner.promptFormInput();
		
		XCTAssert(mockInputService.isGetInputCalled);
		XCTAssertEqual(expectedText, actualInput);
	}
}
