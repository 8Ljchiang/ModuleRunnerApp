//
//  T3UpdateDataCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/27/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3UpdateDataCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitT3UpdateDataCommandHandler() {
		let mockDataService = MockDataService();
		let mockWriteDataService = MockWriteDataService(dataService: mockDataService);
		let updateDataCH = T3UpdateDataCommandHandler(writeDataService: mockWriteDataService);
		
		XCTAssertNotNil(updateDataCH);
    }
	
	func testExecute() {
		let mockGameModule = MockGameModule();
		let mockDataService = MockDataService();
		let mockWriteDataService = MockWriteDataService(dataService: mockDataService);
		let updateDataCH = T3UpdateDataCommandHandler(writeDataService: mockWriteDataService);
		let payload = ["activePlayerIndex": 1, "moves": [1, 2, 3]] as [String : Any];
		let command = Command(type: CommandType.T3UpdateData, payload: payload);
		
		let handlerResponse = updateDataCH.execute(command, module: mockGameModule);
		
		XCTAssertNotNil(handlerResponse);
		XCTAssertEqual(0, handlerResponse.commands.count);
		XCTAssertEqual(0, handlerResponse.errors.count);
		
		XCTAssert(mockWriteDataService.isUpdateStoreCalled);
		XCTAssertNotNil(mockWriteDataService.updateStoreCalledWith);
		XCTAssertEqual(1, mockWriteDataService.updateStoreCalledWith?["activePlayerIndex"] as! Int);
		XCTAssertEqual([1, 2, 3], mockWriteDataService.updateStoreCalledWith?["moves"] as! [Int]);
	}
}
