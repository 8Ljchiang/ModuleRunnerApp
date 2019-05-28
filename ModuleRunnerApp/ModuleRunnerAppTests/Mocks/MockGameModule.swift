//
//  MockGameModule.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockGameModule: GameModuleProtocol {
	var isRunCalled: Bool = false;
	var isStartCalled = false;
	var isDisplayCalled: Bool = false;
	var isPromptForInputCalled: Bool = false;
	var isClearDisplayCalled: Bool = false;
	
	var runner: ModuleRunnerProtocol? = nil;
	var displayCalledWith: String? = nil;
	var defaultInputResponse: String = "";
	
	init() {}
	
	init(defaultInputResponse: String) {
		self.defaultInputResponse = defaultInputResponse;
	}
	
	func start(moduleRunner: ModuleRunnerProtocol) {
		self.isStartCalled = true;
		self.runner = moduleRunner;
	}
	
	func display(_ text: String) {
		self.isDisplayCalled = true;
		self.displayCalledWith = text;
	}
	
	func promptForInput() -> String {
		self.isPromptForInputCalled = true;
		return self.defaultInputResponse;
	}
	
	func clearDisplay() {
		self.isClearDisplayCalled = true;
	}
}
