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
		
		let displayRulesPayload: [String: Any] = ["text": T3Text.rules];
		let displayCommand = Command(type: CommandType.T3Display, payload: displayRulesPayload);
		response.addCommand(displayCommand);
		
		let displayPromptInstructionsPayload: [String: Any] = ["text": T3Text.promptForReadyInstructions];
		let displayCommand2 = Command(type: CommandType.T3Display, payload: displayPromptInstructionsPayload);
		response.addCommand(displayCommand2);
		
		let promptForReadyPayload: [String: Any] = [:];
		let promptForReadyCommand = Command(type: CommandType.T3PromptForReady, payload: promptForReadyPayload);
		response.addCommand(promptForReadyCommand);
		
		return response;
	}
}
