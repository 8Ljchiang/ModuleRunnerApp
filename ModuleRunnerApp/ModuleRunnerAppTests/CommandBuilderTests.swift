//
//  CommandBuilderTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class CommandBuilderTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testWelcomeCommand() {
		let command = CommandBuilder.welcomeCommand();
		
		XCTAssertEqual(CommandType.T3Welcome, command.type);
    }
	
	func testDisplayCommand() {
		let expectedText = "test";
		let command = CommandBuilder.displayCommand(expectedText);
		
		XCTAssertEqual(CommandType.T3Display, command.type);
		XCTAssertEqual(expectedText, command.payload["text"] as? String);
	}
	
	func testDisplayClearCommand() {
		let command = CommandBuilder.displayClearCommand();
		
		XCTAssertEqual(CommandType.T3DisplayClear, command.type);
	}
	
	func testUpdateDataCommand() {
		let expectedData: [String: Any] = ["test1": 1, "test2": 2];
		let command = CommandBuilder.updateDataCommand(expectedData);
		
		XCTAssertEqual(CommandType.T3UpdateData, command.type);
		XCTAssertEqual(expectedData.keys.count, command.payload.keys.count);
		XCTAssertEqual(expectedData["test1"] as? Int, command.payload["test1"] as? Int);
		XCTAssertEqual(expectedData["test2"] as? Int, command.payload["test2"] as? Int);
	}
}
