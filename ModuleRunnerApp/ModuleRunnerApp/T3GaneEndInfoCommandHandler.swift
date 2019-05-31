//
//  T3GaneEndInfoCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3GameEndInfoCommandHandler: CommandHandlerProtocol {
	init(readDataService: ReadDataServiceProtocol) {}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		return CommandHandlerResponse();
	}
}
