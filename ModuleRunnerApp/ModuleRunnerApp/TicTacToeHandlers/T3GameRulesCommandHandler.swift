//
//  T3GameRulesCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3GameRulesCommandHandler: CommandHandlerProtocol {
	init() {}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		let response = CommandHandlerResponse();
		
		let displayCommand = CommandBuilder.displayCommand(T3Text.rules);
		response.addCommand(displayCommand);
		
		let displayCommand2 = CommandBuilder.displayCommand(T3Text.promptForReadyInstructions);
		response.addCommand(displayCommand2);
		
		let promptForReadyPayload: [String: Any] = [:];
		let promptForReadyCommand = Command(type: CommandType.T3PromptForReady, payload: promptForReadyPayload);
		response.addCommand(promptForReadyCommand);
		
		return response;
	}
}
