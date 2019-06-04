//
//  T3GameAvailablePositionsCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 6/3/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3GameAvailablePositionsCommandHandler: CommandHandlerProtocol {
	var readDataService: ReadDataServiceProtocol;
	
	init(readDataService: ReadDataServiceProtocol) {
		self.readDataService = readDataService;
	}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		let response = CommandHandlerResponse();
		
		let store = readDataService.getStore();
		
		guard let moves = store.data["moves"] as? [Move] else {
			response.addError("No moves data found.");
			return response;
		};
		
		guard let boardSize = store.data["boardSize"] as? Int else {
			response.addError("No board size data found.");
			return response;
		};
		
		let availablePositions = T3PositionHelper.getAvailablePositions(moves: moves, boardSize: boardSize);
		let availablePositionsString = availablePositions.map { String($0) }.joined(separator: ", ");
		let payloadText = "Available Positions: \(availablePositionsString).";
		let displayCommand = CommandBuilder.displayCommand(payloadText);
		let promptForPositionCommand = CommandBuilder.promptForPositionCommand();
		
		response.addCommand(displayCommand);
		response.addCommand(promptForPositionCommand);
		
		return response;
	}
}
