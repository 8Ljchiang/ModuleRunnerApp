//
//  CommandHandlerResolver.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol CommandHandlerResolverProtocol {
	func getHandler(_ commandType: CommandType) -> CommandHandlerProtocol;
	func addHandler(type: CommandType, commandHandler: CommandHandlerProtocol);
}

class CommandHandlerResolver: CommandHandlerResolverProtocol {
	var handlersMap: [CommandType: CommandHandlerProtocol] = [:];
	
	init() {}
	
	func addHandler(type: CommandType, commandHandler: CommandHandlerProtocol) {
		self.handlersMap.updateValue(commandHandler, forKey: type);
	}
	
	func getHandler(_ commandType: CommandType) -> CommandHandlerProtocol {
		let handler = self.handlersMap[commandType] ?? DefaultCommandHandler();
		return handler;
	}
}
