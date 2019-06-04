//
//  T3PromptForPositionCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 6/3/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3PromptForPositionCommandHandler: CommandHandlerProtocol {
	var readDataService: ReadDataServiceProtocol;
	
	init(readDataService: ReadDataServiceProtocol) {
		self.readDataService = readDataService;
	}
	
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		
		let store = readDataService.getStore();
		guard let movesCache = store.data["moves"] as? [Move] else {
			let response = CommandHandlerResponse();
			response.addError("No moves data found.");
			return response;
		}
		
		guard let boardSize = store.data["boardSize"] as? Int else {
			let response = CommandHandlerResponse();
			response.addError("No board size data found.");
			return response;
		}
		
		guard let currentActivePlayerIndex = store.data["activePlayerIndex"] as? Int else {
			let response = CommandHandlerResponse();
			response.addError("No active player index data found.");
			return response;
		}
		
		guard let players = store.data["players"] as? [String] else {
			let response = CommandHandlerResponse();
			response.addError("No player data found.");
			return response;
		};
		
		let maxPositions = boardSize * boardSize;
		
//		print("*** BEFORE PROMPT FOR INPUT");
		if movesCache.count < maxPositions {
//			print("*** PROMPT FOR INPUT");
			let inputString = module.promptForInput();
			let isInputValidPosition = T3PositionHelper.isValidInputForPosition(inputString, moves: movesCache, boardSize: boardSize);
			
			guard isInputValidPosition else {
				let response = CommandHandlerResponse();
				response.addError("Invalid position: \(inputString)");
				let gameInfoCommand = CommandBuilder.gameInfoCommand();
//				let positionsCommand = CommandBuilder.gameAvailablePositionsCommand();
				response.addCommand(gameInfoCommand);
//				response.addCommand(positionsCommand);
				return response;
			}
			
			let inputPosition = Int(inputString);
			guard inputPosition != nil else {
				let response = CommandHandlerResponse();
				return response;
			}
			
			let isPositionAvailable = T3PositionHelper.isPositionAvailable(position: inputPosition!, moves: movesCache, boardSize: boardSize);
			
			guard isPositionAvailable else {
				let response = CommandHandlerResponse();
				return response;
			}
		
			let currentPlayerId = players[currentActivePlayerIndex];
			let marker = MarkerType.Marker1.rawValue;
			let newMove = Move(playerId: currentPlayerId, position: inputPosition!, marker: marker);
			let newMoves = T3MoveHelper.appendMove(newMove, moves: movesCache, boardSize: boardSize);
			let movePositions = T3PositionHelper.getPositionsForMarker(moves: newMoves, marker: MarkerType.Marker1.rawValue);
			
			let winningPattern = T3PatternHelper.findWinningPattern(positions: movePositions, boardSize: boardSize);
			
			if newMoves.count == maxPositions {
				let response = CommandHandlerResponse();
				var updateData: [String: Any] = [:];
				updateData["moves"] = newMoves;
				updateData["winner"] = "No one";
				let updateCommand = CommandBuilder.updateDataCommand(updateData);
				let gameEndInfoCommand = CommandBuilder.gameEndInfoCommand();
				response.addCommand(updateCommand);
				response.addCommand(gameEndInfoCommand);
				return response;
			} else if winningPattern != nil && winningPattern!.count == boardSize {
				let response = CommandHandlerResponse();
				var updateData: [String: Any] = [:];
				updateData["moves"] = newMoves;
				updateData["winner"] = currentPlayerId;
				updateData["winningPattern"] = winningPattern;
				let updateCommand = CommandBuilder.updateDataCommand(updateData);
				let gameEndInfoCommand = CommandBuilder.gameEndInfoCommand();
				response.addCommand(updateCommand);
				response.addCommand(gameEndInfoCommand);
				return response;
			}
			
			let nextPlayerIndex = T3PlayerHelper.cycleActivePlayerIndex(currentIndex: currentActivePlayerIndex, playerCount: players.count);
			let movesWithAutoGenMove = T3MoveHelper.appendGeneratedMove(playerId: players[nextPlayerIndex], marker: MarkerType.Marker2.rawValue, moves: newMoves, boardSize: boardSize);
			
			let botPositions = T3PositionHelper.getPositionsForMarker(moves: movesWithAutoGenMove, marker: MarkerType.Marker2.rawValue);
			let winningPattern2 = T3PatternHelper.findWinningPattern(positions: botPositions, boardSize: boardSize);
			
			if newMoves.count == maxPositions {
				let response = CommandHandlerResponse();
				var updateData: [String: Any] = [:];
				updateData["moves"] = newMoves;
				updateData["winner"] = "No one";
				let updateCommand = CommandBuilder.updateDataCommand(updateData);
				let gameEndInfoCommand = CommandBuilder.gameEndInfoCommand();
				response.addCommand(updateCommand);
				response.addCommand(gameEndInfoCommand);
				return response;
			} else if winningPattern2 != nil && winningPattern2!.count == boardSize {
				let response = CommandHandlerResponse();
				var updateData: [String: Any] = [:];
				updateData["moves"] = movesWithAutoGenMove;
				updateData["winner"] = currentPlayerId;
				updateData["winningPattern"] = winningPattern2;
				let updateCommand = CommandBuilder.updateDataCommand(updateData);
				let gameEndInfoCommand = CommandBuilder.gameEndInfoCommand();
				response.addCommand(updateCommand);
				response.addCommand(gameEndInfoCommand);
				return response;
			}
			
			let response = CommandHandlerResponse();
			let updateData: [String: Any] = [
				"moves": movesWithAutoGenMove,
				"activePlayerIndex": T3PlayerHelper.cycleActivePlayerIndex(currentIndex: nextPlayerIndex, playerCount: players.count)
			];
			let updateCommand = CommandBuilder.updateDataCommand(updateData);
			let gameInfoCommand = CommandBuilder.gameInfoCommand();
//			let gameAvailablePositionsCommand = CommandBuilder.gameAvailablePositionsCommand();
	
			response.addCommand(updateCommand);
			response.addCommand(gameInfoCommand);
//			response.addCommand(gameAvailablePositionsCommand);
	
			return response;
		}
		
		let response = CommandHandlerResponse();
		var updateData: [String: Any] = [:];
		updateData["winner"] = "No one";
		let updateCommand = CommandBuilder.updateDataCommand(updateData);
		let gameEndInfo = CommandBuilder.gameEndInfoCommand();
		response.addCommand(updateCommand);
		response.addCommand(gameEndInfo);
	
		return response;
	}
}
