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
//			print("*** Dispatcher: processingCommand ");
//			print(command.type);
			self.processCommand(command);
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
		
//		if handler != nil {
//			print("*** Dispatcher: handler");
//			print(handler);
//			print("*** Dispatcher: command");
//			print(command.type);
			let response = handler.execute(command, module: self.module!);
			
			self.handleResponse(response);
//		}
	}
	
	private func handleResponse(_ response: CommandHandlerResponseProtocol) {
//		print("*** Dispatcher: handlingResponse")
//		print("*** Dispatcher: response commands")
//		print(response.commands.count);
//		print("*** Dispatcher: response errors")
//		print(response.errors.count);
		self.handleResponseCommands(response.commands);
		self.handleResponseErrors(response.errors);
		
		
	}
	
	private func handleResponseCommands(_ commands: [CommandProtocol]) {
		if commands.count > 0 {
			for command in commands {
				// LOG: print("*** queue command: \(command.type)");
				self.queueCommand(command);
			}
		}
	}
	
	private func handleResponseErrors(_ errors: [String]) {
		if errors.count > 0 {
			for errorMessage in errors {
				// LOG ERROR: print("*** queue errorMessage: \(errorMessage)");
//				let displayPayload: [String: Any] = ["text": errorMessage];
//				let displayCommand = Command(type: CommandType.T3Display, payload: displayPayload);
				let displayCommand = CommandBuilder.displayCommand(errorMessage);
				self.queueCommand(displayCommand);
			}
		}
	}
}
