//
//  T3UpdateDataCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/27/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3UpdateDataCommandHandler: CommandHandlerProtocol {
	var writeDataService: WriteDataServiceProtocol;
	
	init(writeDataService: WriteDataServiceProtocol) {
		self.writeDataService = writeDataService;
	}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		self.writeDataService.updateStore(command.payload);
		return CommandHandlerResponse();
	}
}
