//
//  T3GameInfoCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 6/3/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3GameInfoCommandHandler: CommandHandlerProtocol {
	var readDataService: ReadDataServiceProtocol;
	
	init(readDataService: ReadDataServiceProtocol) {
		self.readDataService = readDataService;
	}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		return CommandHandlerResponse();
	}
}
