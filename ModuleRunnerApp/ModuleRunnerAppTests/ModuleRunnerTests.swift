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
}
