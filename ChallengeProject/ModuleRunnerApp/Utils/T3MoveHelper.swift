//
//  T3MoveHelper.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/29/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3MoveHelper {
	static func generateMove(playerId: String, marker: String, moves: [Move], boardSize: Int) -> Move? {
		let availablePositions = T3PositionHelper.getAvailablePositions(moves: moves, boardSize: boardSize);
		
		if availablePositions.count > 0 {
			guard let position = availablePositions.randomElement() else { return nil };
			return Move(playerId: playerId, position: position, marker: marker);
		}
		
		return nil;
	}
	
	static func appendMove(_ move: Move, moves: [Move], boardSize: Int) -> [Move] {
		let maxMovesCount = boardSize * boardSize;
		if moves.count < maxMovesCount {
			var newMoves = moves.map({(value: Move) -> Move in return Move(playerId: value.playerId, position: value.position, marker: value.marker)});
			newMoves.append(move);
			return newMoves;
		}
		return moves;
	}
	
	static func appendGeneratedMove(playerId: String, marker: String, moves: [Move], boardSize: Int) -> [Move] {
		let maxMovesCount = boardSize * boardSize;
		if moves.count < maxMovesCount {
			guard let generatedMove = generateMove(playerId: playerId, marker: marker, moves: moves, boardSize: boardSize) else { return moves };
			let newMoves = appendMove(generatedMove, moves: moves, boardSize: boardSize);
			return newMoves;
		}
		return moves;
	}
	
	static func appendGeneratedSkilledMove(playerId: String, marker: String, moves: [Move], boardSize: Int) -> [Move] {
		let maxMovesCount = boardSize * boardSize;
		if moves.count < maxMovesCount {
			guard let generatedMove = generateSkilledMove(playerId: playerId, marker: marker, moves: moves, boardSize: boardSize) else { return moves };
			let newMoves = appendMove(generatedMove, moves: moves, boardSize: boardSize);
			return newMoves;
		}
		return moves;
	}
	
	static func generateSkilledMove(playerId: String, marker: String, moves: [Move], boardSize: Int) -> Move? {
		let availablePositions = T3PositionHelper.getAvailablePositions(moves: moves, boardSize: boardSize);
		
		if availablePositions.count > 0 {
			let simulatedMove = getOptimalSimulatedMove(currentMoves: moves, currentPlayerMarker: marker, iteration: 0, boardSize: boardSize);
			return Move(playerId: playerId, position: simulatedMove.key, marker: marker);
		}
		
		return nil;
	}
	
	static func scoreMoves(currentMoves: [Move], currentPlayerMarker: String, iteration: Int, boardSize: Int) -> Int {
		
		let currentPlayerPositions = T3PositionHelper.getPositionsForMarker(moves: currentMoves, marker: currentPlayerMarker);
		let winningPatternForCurrentPlayer = T3PatternHelper.findWinningPattern(positions: currentPlayerPositions, boardSize: boardSize);
		if iteration % 2 == 0 {
			if winningPatternForCurrentPlayer != nil && winningPatternForCurrentPlayer!.count == boardSize {
				return 100 - iteration;
			}
		} else {
			if winningPatternForCurrentPlayer != nil && winningPatternForCurrentPlayer!.count == boardSize {
				return -100 + iteration;
			}
		}
		return 0;
	}
	
	static func getOptimalSimulatedMove(currentMoves: [Move], currentPlayerMarker: String, iteration: Int, boardSize: Int) -> (key: Int, value: Int)	 {
		let availablePositions = T3PositionHelper.getAvailablePositions(moves: currentMoves, boardSize: boardSize);
		var simulatedPositionValues: [Int: Int] = [:];
		let opponentMarker = MarkerType.Marker1.rawValue == currentPlayerMarker ? MarkerType.Marker2.rawValue : MarkerType.Marker1.rawValue;
		for position in availablePositions {
			let newMove = Move(playerId: "Any", position: position, marker: currentPlayerMarker);
			let newMoves = T3MoveHelper.appendMove(newMove, moves: currentMoves, boardSize: boardSize);
			let positionsForCurrentPlayer = T3PositionHelper.getPositionsForMarker(moves: newMoves, marker: currentPlayerMarker);
			let winningPatternForCurrentPlayer = T3PatternHelper.findWinningPattern(positions: positionsForCurrentPlayer, boardSize: boardSize);
			let newAvailablePositions = T3PositionHelper.getAvailablePositions(moves: newMoves, boardSize: boardSize);
			if  newAvailablePositions.count == 0 || winningPatternForCurrentPlayer != nil {
				let score = scoreMoves(currentMoves: newMoves, currentPlayerMarker: currentPlayerMarker, iteration: iteration, boardSize: boardSize);
				simulatedPositionValues[position] = score;
			} else {
				let newMovesSet = newMoves;
				let newKeySet = getOptimalSimulatedMove(currentMoves: newMovesSet, currentPlayerMarker: opponentMarker, iteration: iteration + 1, boardSize: boardSize);
				simulatedPositionValues[position] = newKeySet.value;
			}
		}
		
		if iteration % 2 == 0 {
			let keySet = getHighestValuePosition(simulatedPositionValues);
			return keySet;
		} else {
			let keySet = getLowestValuePosition(simulatedPositionValues);
			return keySet;
		}
	}
	
	static func getHighestValuePosition(_ simulatedPositionValues: [Int: Int]) -> (key: Int, value: Int) {
		return simulatedPositionValues.max { a, b in a.value < b.value }!;
	}
	
	static func getLowestValuePosition(_ simulatedPositionValues: [Int: Int]) -> (key: Int, value: Int) {
		return simulatedPositionValues.min { a, b in a.value < b.value }!;
	}
}
