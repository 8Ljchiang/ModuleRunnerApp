//
//  ModuleRunner.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol ModuleRunnerProtocol {
	func display(text: String);
	func promptForInput() -> String;
}

class ModuleRunner {
	var presenterService: PresenterServiceProtocol;
	var inputService: InputServiceProtocol;
	
	init(
		presenterService: PresenterServiceProtocol,
		inputService: InputServiceProtocol
	) {
		self.presenterService = presenterService;
		self.inputService = inputService;
	}
	
	func display(_ text: String) {
		self.presenterService.display(text);
	}
	
	func promptForInput() -> String {
		return self.inputService.getInput();
	}
}
