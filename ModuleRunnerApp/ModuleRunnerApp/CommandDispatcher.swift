//
//  CommandDispatcher.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol CommandDispatcherProtocol {
	func connectModule(gameModule: GameModuleProtocol);
	func queueCommand(_ command: CommandProtocol);
	func processQueue();
}

class CommandDispatcher: CommandDispatcherProtocol {
	var module: GameModuleProtocol?;
	var queue: [CommandProtocol] = Array();
	var resolver: CommandHandlerResolverProtocol;
	
	init(resolver: CommandHandlerResolverProtocol) {
		self.resolver = resolver;
	}
	
	func queueCommand(_ command: CommandProtocol) {
		self.queue.append(command);
	}
	
	func processQueue() {
		while self.queue.count > 0 {
			let command = self.queue.removeFirst();
			self.processCommand(command);
		}
	}
	
	func connectModule(gameModule: GameModuleProtocol) {
		self.module = gameModule;
	}
	
	private func processCommand(_ command: CommandProtocol) {
	
	}
}
