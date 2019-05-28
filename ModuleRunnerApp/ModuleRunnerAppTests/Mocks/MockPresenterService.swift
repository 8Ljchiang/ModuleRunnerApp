//
//  MockPresenterService.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockPresenterService: PresenterServiceProtocol {
	var isDisplayCalled: Bool = false;
	var isClearDisplayCalled: Bool = false;
	var displayCalledWith: String = "";
	
	init() {}
	
	func display(_ text: String) {
		self.isDisplayCalled = true;
		self.displayCalledWith = text;
	}
	
	func clearDisplay() {
		self.isDisplayCalled = true;
	}
}
