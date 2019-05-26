//
//  MockGameModule.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockGameModule: GameModuleProtocol {
	var isStartCalled = false;
	var runner: ModuleRunnerProtocol? = nil;
	
	init() {}
	
	func start(moduleRunner: ModuleRunnerProtocol) {
		self.isStartCalled = true;
		self.runner = moduleRunner;
	}
}
