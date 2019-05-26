//
//  MockInputService.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockInputService: InputServiceProtocol {
	var defaultResponse: String;
	var isGetInputCalled: Bool = false;
	
	init(_ defaultResponse: String) {
		self.defaultResponse = defaultResponse;
	}
	
	func getInput() {
		return self.defaultResponse;
	}
}
