//
//  ModuleRunner.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol ModuleRunnerProtocol {
	func display(_ text: String);
	func clearDisplay();
	func promptForInput() -> String;
	func run(gameModule: GameModuleProtocol);
}

class ModuleRunner: ModuleRunnerProtocol {
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
	
	func clearDisplay() {
		
	}
	
	func promptForInput() -> String {
		return self.inputService.getInput();
	}
	
	func run(gameModule: GameModuleProtocol) {
		gameModule.start(moduleRunner: self);
	}
}
