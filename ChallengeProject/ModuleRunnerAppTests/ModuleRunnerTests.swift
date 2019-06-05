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
		let defaultText = "Yes";
		
		let mockPresenterService = MockPresenterService();
		let mockInputService = MockInputService(defaultText);
		
		let mRunner = ModuleRunner(presenterService: mockPresenterService, inputService: mockInputService);
		
		XCTAssertNotNil(mRunner);
    }
	
	func testDisplay() {
		let defaultText = "Yes";
		
		let mockPresenterService = MockPresenterService();
		let mockInputService = MockInputService(defaultText);
		
		let mRunner = createModuleRunner(mockPresenterService, mockInputService);
		
		let expectedText = "Hello world!";
		
		mRunner.display(expectedText);
		
		XCTAssert(mockPresenterService.isDisplayCalled);
		XCTAssertEqual(mockPresenterService.displayCalledWith, expectedText);
	}
	
	func testClearDisplay() {
		let defaultText = "Yes";
		
		let mockPresenterService = MockPresenterService();
		let mockInputService = MockInputService(defaultText);
		
		let mRunner = createModuleRunner(mockPresenterService, mockInputService);
		
		mRunner.clearDisplay();
		
		XCTAssert(mockPresenterService.isClearDisplayCalled);
	}
	
	func testPromptForInput() {
		let expectedText = "Yes";
		
		let mockPresenterService = MockPresenterService();
		let mockInputService = MockInputService(expectedText);
		
		let mRunner = ModuleRunner(
			presenterService: mockPresenterService,
			inputService: mockInputService
		);
		
		let actualInput = mRunner.promptForInput();
		
		XCTAssert(mockInputService.isGetInputCalled);
		XCTAssertEqual(expectedText, actualInput);
	}
	
	func testRunGameModule() {
		let expectedText = "Yes";
		
		let mockPresenterService = MockPresenterService();
		let mockInputService = MockInputService(expectedText);
		let mockGameModule = MockGameModule();
		
		let mRunner = ModuleRunner(
			presenterService: mockPresenterService,
			inputService: mockInputService
		);
		
		mRunner.run(gameModule: mockGameModule);
		
		XCTAssert(mockGameModule.isStartCalled);
		XCTAssertNotNil(mockGameModule.runner);
	}
}

func createModuleRunner(_ presenterService: PresenterServiceProtocol, _ inputService: InputServiceProtocol) -> ModuleRunner {	
	
	let mRunner = ModuleRunner(
		presenterService: presenterService,
		inputService: inputService
	);
	
	return mRunner;
}
