//
//  GameModule.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol GameModuleProtocol {
	var runner: ModuleRunnerProtocol? { get set };
	func start(moduleRunner: ModuleRunnerProtocol);
	func display(_ text: String);
	func promptForInput() -> String;
}

class GameModule: GameModuleProtocol {
	var runner: ModuleRunnerProtocol?;
	
	init() {}
	
	init(moduleRunner: ModuleRunnerProtocol) {
		self.runner = moduleRunner;
	}
	
	func start(moduleRunner: ModuleRunnerProtocol) {
		
	}
	
	func display(_ text: String) {
		self.runner!.display(text);
	}
	
	func promptForInput() -> String {
		return self.runner!.promptForInput();
	}
}
