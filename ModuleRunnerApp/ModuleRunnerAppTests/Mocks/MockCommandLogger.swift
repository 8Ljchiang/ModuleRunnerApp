//
//  MockCommandLogger.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 6/3/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockCommandLogger: CommandLoggerProtocol {
	var isLogCommandCalled: Bool = false;
	var logCommandCalledWith: CommandProtocol?;
	
	init () {}
	
	func logCommand(_ command: CommandProtocol) {
		self.isLogCommandCalled = true;
		self.logCommandCalledWith = command;
	}
}
