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
		let payloadText = command.payload["text"] as? String ?? "";
		let displayText = payloadText;
		
		module.display(displayText);
		return CommandHandlerResponse();
	}
}
