//
//  T3GameWelcomeCommandHandlerTests.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3GameWelcomeCommandHandlerTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitT3GameWelcomeCommandHandler() {
		let welcomeCH = T3GameWelcomeCommandHandler();
		
		XCTAssertNotNil(welcomeCH);
    }
}
