//
//  T3DisplayCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3DisplayCommandHandler: CommandHandlerProtocol {
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		module.display(command.payload["text"] as! String);
		return CommandHandlerResponse();
	}
}
