//
//  MockCommandDispatcher.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockCommandDispatcher: CommandDispatcherProtocol {
	var isQueueCommandCalled: Bool = false;
	var isProcessQueueCalled: Bool = false;
	var queueCommandCalledWith: CommandProtocol? = nil;
	
	func queueCommand(_ command: CommandProtocol) {
		self.isQueueCommandCalled = true;
		self.queueCommandCalledWith = command;
	}
	
	func processQueue() {
		self.isProcessQueueCalled = true;
	}
}
