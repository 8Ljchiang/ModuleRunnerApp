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
	func promptForInput();
}

class ModuleRunner {
	var presenterService: PresenterServiceProtocol;
	var inputService: InputServiceProtocol;
	
	init(
		presenterService: PresenterServiceProtocol,
		inputService: InputServiceProtocol
	) {
		self.presenterService = presenterService
	}
	
	func display(_ text: String) {
		self.presenterService.display(text);
	}
	
	func promptForInput() {
		return self.inputService.getInput();
	}
}
