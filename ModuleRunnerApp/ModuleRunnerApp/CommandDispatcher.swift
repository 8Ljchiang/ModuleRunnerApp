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
	var logger: CommandLoggerProtocol;
	var resolver: CommandHandlerResolverProtocol;
	
	init(resolver: CommandHandlerResolverProtocol, commandLogger: CommandLoggerProtocol) {
		self.resolver = resolver;
		self.logger = commandLogger;
	}
	
	func queueCommand(_ command: CommandProtocol) {
		self.queue.append(command);
	}
	
	func processQueue() {
		while self.queue.count > 0 {
			let command = self.queue.removeFirst();
//			print("*** Dispatcher: processingCommand ");
//			print(command.type);
			self.processCommand(command);
			self.logger.logCommand(command);
		}
	}
	
	func connectModule(gameModule: GameModuleProtocol) {
//		print("*** Dispatcher: connectModule");
		
		self.module = gameModule;
		
//		print("*** Dispatcher: Is module nil: ");
//		print(gameModule == nil);
//		print(self.module == nil);

	}
	
	private func processCommand(_ command: CommandProtocol) {
		let handler = self.resolver.getHandler(command.type);
		let response = handler.execute(command, module: self.module!);
		self.handleResponse(response);
	}
	
	private func handleResponse(_ response: CommandHandlerResponseProtocol) {
		self.handleResponseCommands(response.commands);
		self.handleResponseErrors(response.errors);
	}
	
	private func handleResponseCommands(_ commands: [CommandProtocol]) {
		if commands.count > 0 {
			for command in commands {
				self.queueCommand(command);
			}
		}
	}
	
	private func handleResponseErrors(_ errors: [String]) {
		if errors.count > 0 {
			for errorMessage in errors {
				let displayCommand = CommandBuilder.displayCommand(errorMessage);
				self.queueCommand(displayCommand);
			}
		}
	}
}
