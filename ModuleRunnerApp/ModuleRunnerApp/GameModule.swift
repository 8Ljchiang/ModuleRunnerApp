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
	func clearDisplay();
	func promptForInput() -> String;
}

class GameModule: GameModuleProtocol {
	var runner: ModuleRunnerProtocol?;
	var dispatcher: CommandDispatcherProtocol;
	
	init(commandDispatcher: CommandDispatcherProtocol) {
		self.dispatcher = commandDispatcher;
		self.dispatcher.connectModule(gameModule: self);
	}
	
	init(moduleRunner: ModuleRunnerProtocol, commandDispatcher: CommandDispatcherProtocol) {
		self.runner = moduleRunner;
		self.dispatcher = commandDispatcher;
		self.dispatcher.connectModule(gameModule: self);
	}
	
	func start(moduleRunner: ModuleRunnerProtocol) {
		self.runner = moduleRunner;
//		print("*** GameModule: assigning module to dispatcher");
//		self.dispatcher.connectModule(gameModule: self);
		
		let initialCommand = CommandBuilder.welcomeCommand();
		
		self.dispatcher.queueCommand(initialCommand);
		self.dispatcher.processQueue();
	}
	
	func display(_ text: String) {
		self.runner!.display(text);
	}
	
	func clearDisplay() {
		self.runner!.clearDisplay();
	}
	
	func promptForInput() -> String {
		return self.runner!.promptForInput();
	}
}
