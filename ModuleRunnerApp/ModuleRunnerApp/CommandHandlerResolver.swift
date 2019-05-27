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
}

class CommandHandlerResolver: CommandHandlerResolverProtocol {
	init() {}
	
	func getHandler(_ commandType: CommandType) -> CommandHandlerProtocol {
		return T3DisplayCommandHandler();
	}
}
