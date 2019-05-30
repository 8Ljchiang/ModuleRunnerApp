//
//  T3ReplayInstructionsCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3ReplayInstructionsCommandHandler: CommandHandlerProtocol {
	init() {}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		let response = CommandHandlerResponse();
		
		let displayCommand = CommandBuilder.displayCommand(T3Text.replayInstructions);
		response.addCommand(displayCommand);
		
		let promptForReplayCommand = CommandBuilder.promptForReplayCommand();
		response.addCommand(promptForReplayCommand);
		
		return response;
	}
}
