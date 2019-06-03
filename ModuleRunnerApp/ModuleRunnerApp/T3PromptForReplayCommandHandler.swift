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
			let initialData: [String: Any] = [
				"boardSize": 3,
				"playerCount": 1,
				"aiSkill": 100,
				"moves": [],
				"activePlayerIndex": 0,
				"players": ["P1-Player", "P2-Bot"],
			];
			let updateCommand = CommandBuilder.updateDataCommand(initialData);
			response.addCommand(updateCommand);
			
//			let welcomeCommand = CommandBuilder.welcomeCommand();
//			response.addCommand(welcomeCommand);
			let gameInfoCommand = CommandBuilder.gameInfoCommand();
			response.addCommand(gameInfoCommand);
		}
		
		return response
	}
}
