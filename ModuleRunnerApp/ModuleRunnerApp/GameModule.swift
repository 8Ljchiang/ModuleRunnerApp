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
	var dispatcher: CommandDispatcherProtocol;
	
	init(commandDispatcher: CommandDispatcherProtocol) {
		self.dispatcher = commandDispatcher;
	}
	
	init(moduleRunner: ModuleRunnerProtocol, commandDispatcher: CommandDispatcherProtocol) {
		self.runner = moduleRunner;
		self.dispatcher = commandDispatcher;
	}
	
	func start(moduleRunner: ModuleRunnerProtocol) {
		self.runner = moduleRunner;
		
		let initialCommand = Command(type: CommandType.T3Welcome, payload: "Payload");
		self.dispatcher.queueCommand(initialCommand);
		self.dispatcher.processQueue();
	}
	
	func display(_ text: String) {
		self.runner!.display(text);
	}
	
	func promptForInput() -> String {
		return self.runner!.promptForInput();
	}
}
