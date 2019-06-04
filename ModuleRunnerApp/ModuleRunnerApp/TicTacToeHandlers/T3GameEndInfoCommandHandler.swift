//
//  T3GaneEndInfoCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3GameEndInfoCommandHandler: CommandHandlerProtocol {
	var readDataService: ReadDataServiceProtocol;
	
	init(readDataService: ReadDataServiceProtocol) {
		self.readDataService = readDataService;
	}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		let response = CommandHandlerResponse();
		
		let clearDisplayCommand = CommandBuilder.displayClearCommand();
		response.addCommand(clearDisplayCommand);
		
		let titleDisplayCommand = CommandBuilder.displayCommand(T3Text.title);
		response.addCommand(titleDisplayCommand);
		
		let store = readDataService.getStore();
		
		guard let moves = store.data["moves"] as? [Move] else {
			let response = CommandHandlerResponse();
			response.addError("No moves data found.");
			return response;
		};
		guard let boardSize = store.data["boardSize"] as? Int else {
			let response = CommandHandlerResponse();
			response.addError("No board size data found.");
			return response;
		}
		let boardRenderString = T3BoardRenderer.render(moves, boardSize: boardSize);
		let boardDisplayCommand = CommandBuilder.displayCommand(boardRenderString);
		response.addCommand(boardDisplayCommand);
		
		guard let winner = store.data["winner"] as? String else {
			let response = CommandHandlerResponse();
			response.addError("No winner data found.");
			return response;
		}
		guard let winningPattern = store.data["winningPattern"] as? [Int] else {
			let response = CommandHandlerResponse();
			response.addError("No winning pattern data found.");
			return response;
		}
		let winningPatternStringArray = winningPattern.map { String($0) };
		let winningPatternString = winningPatternStringArray.joined(separator: ", ");
		let endInfoString = "The game is over.\n\(winner) is the winner.\nWinning Pattern: \(winningPatternString).\n";
		
		let endInfoDisplayCommand = CommandBuilder.displayCommand(endInfoString);
		response.addCommand(endInfoDisplayCommand);
		
		let replayInstructionsCommand = CommandBuilder.replayInstructionsCommand();
		response.addCommand(replayInstructionsCommand);
		
		return response;
	}
}
