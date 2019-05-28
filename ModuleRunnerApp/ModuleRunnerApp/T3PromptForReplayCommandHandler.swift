//
//  T3PromptForReplayCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3PromptForReplayCommandHandler: CommandHandlerProtocol {
	init() {}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		let response = CommandHandlerResponse();
		
		let userInput = module.promptForInput();
		
		if userInput == "replay" {
			let welcomeCommand = CommandBuilder.welcomeCommand();
			response.addCommand(welcomeCommand);
			return response;
		}
		
		return CommandHandlerResponse();
	}
}
