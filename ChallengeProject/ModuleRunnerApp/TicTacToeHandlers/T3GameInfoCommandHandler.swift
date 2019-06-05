//
//  T3GameInfoCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 6/3/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3GameInfoCommandHandler: CommandHandlerProtocol {
	var readDataService: ReadDataServiceProtocol;
	
	init(readDataService: ReadDataServiceProtocol) {
		self.readDataService = readDataService;
	}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		let response = CommandHandlerResponse();
		
		let clearDisplayCommand = CommandBuilder.displayClearCommand();
		response.addCommand(clearDisplayCommand);
		
		let store = readDataService.getStore();
		guard let moves = store.data["moves"] as? [Move] else {
			let response = CommandHandlerResponse();
			response.addError("No moves data found.");
			return response;
		}
		
		guard let boardSize = store.data["boardSize"] as? Int else {
			let response = CommandHandlerResponse();
			response.addError("No board size data found.");
			return response;
		}
		
		guard let activePlayerIndex = store.data["activePlayerIndex"] as? Int else {
			let response = CommandHandlerResponse();
			response.addError("No active player index data found.");
			return response;
		}
		
		guard let players = store.data["players"] as? [String] else {
			let response = CommandHandlerResponse();
			response.addError("No player data found.");
			return response;
		}
		
		let dislayTitleCommand = CommandBuilder.displayCommand(T3Text.title);
		response.addCommand(dislayTitleCommand);
		
		let boardString = T3BoardRenderer.render(moves, boardSize: boardSize);
		let displayBoardCommand = CommandBuilder.displayCommand(boardString);
		response.addCommand(displayBoardCommand);
		
		let currentPlayer = players[activePlayerIndex];
		let turnInfoString = "\n\(currentPlayer)'s turn. Select a position.";
		
		let displayInfoCommand = CommandBuilder.displayCommand(turnInfoString);
		response.addCommand(displayInfoCommand);
		
		let availablePositionsCommand = CommandBuilder.gameAvailablePositionsCommand();
		response.addCommand(availablePositionsCommand);
		
		return response;
	}
}
