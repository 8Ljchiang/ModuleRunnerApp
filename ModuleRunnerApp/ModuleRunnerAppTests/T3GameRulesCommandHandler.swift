//
//  T3GameRulesCommandHandler.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import XCTest

class T3GameRulesCommandHandler: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitT3GameRulesCommandHandler() {
		let rulesCH = T3GameRulesCommandHandler();
		
		XCTAssertNotNil(rulesCH);
    }
}
