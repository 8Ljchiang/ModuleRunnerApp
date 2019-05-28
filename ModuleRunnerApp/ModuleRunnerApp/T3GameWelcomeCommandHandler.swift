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
//		print("*** WelcomeHandler");
		let response = CommandHandlerResponse();
		
		let clearDisplayPayload: [String: Any] = [:];
		let clearDisplayCommand = Command(type: CommandType.T3DisplayClear, payload: clearDisplayPayload);
		response.addCommand(clearDisplayCommand);
		
//		let displayPayload: [String: Any] = ["text": T3Text.welcome];
//		let displayCommand = Command(type: CommandType.T3Display, payload: displayPayload);
		let displayCommand = CommandBuilder.displayCommand(T3Text.welcome);
		response.addCommand(displayCommand);
		
		let rulesPayload: [String: Any] = [:];
		let rulesCommand = Command(type: CommandType.T3Rules, payload: rulesPayload);
		response.addCommand(rulesCommand);
		
//		print("*** WelcomeHandler: response commands count");
//		print(response.commands.count);
		return response;
	}
}
