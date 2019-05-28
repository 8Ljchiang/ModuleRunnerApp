//
//  MockModuleRunner.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockModuleRunner: ModuleRunnerProtocol {
	var isDisplayCalled: Bool = false;
	var isClearDisplayCalled: Bool = false;
	var isPromptForInputCalled: Bool = false;
	var isRunCalled: Bool = false;
	
	var displayCalledWith: String? = nil;
	var runCalledWith: GameModuleProtocol? = nil;
	var defaultInputResponse: String = "";
	
	init(defaultInputResponse: String) {
		self.defaultInputResponse = defaultInputResponse;
	}
	
	func display(_ text: String) {
		self.displayCalledWith = text;
		self.isDisplayCalled = true;
	}
	
	func clearDisplay() {
		self.isClearDisplayCalled = true;
	}
	
	func promptForInput() -> String {
		self.isPromptForInputCalled = true;
		return self.defaultInputResponse;
	}
	
	func run(gameModule: GameModuleProtocol) {
		self.isRunCalled = true;
		self.runCalledWith = gameModule;
	}
}
