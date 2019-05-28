//
//  T3PromptForReadyCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3PromptForReadyCommandHandler: CommandHandlerProtocol {
	init() {}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		let response = CommandHandlerResponse();
		
		let userInput = module.promptForInput();
		
		if userInput == "ready" {			
			let gameInfoPayload: [String: Any] = [:];
			let gameInfoCommand = Command(type: CommandType.T3GameInfo, payload: gameInfoPayload);
			response.addCommand(gameInfoCommand);
		} else {
			let welcomePayload: [String: Any] = [:];
			let welcomeCommand = Command(type: CommandType.T3Welcome, payload: welcomePayload);
			response.addCommand(welcomeCommand);
			
			response.addError("Invalid input: \(userInput)");
		}
		
		return response;
	}
}
