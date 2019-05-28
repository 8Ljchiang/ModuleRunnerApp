//
//  T3GameWelcomeCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3GameWelcomeCommandHandler: CommandHandlerProtocol {
	init() {}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		let response = CommandHandlerResponse();
		
		let displayPayload: [String: Any] = ["text": T3Text.welcome];
		let displayCommand = Command(type: CommandType.T3Display, payload: displayPayload);
		response.addCommand(displayCommand);
		
		let rulesPayload: [String: Any] = [:];
		let rulesCommand = Command(type: CommandType.T3Rules, payload: rulesPayload);
		response.addCommand(rulesCommand);
		
		return response;
	}
}
