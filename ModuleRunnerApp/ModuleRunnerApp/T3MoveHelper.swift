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
		let maxMoves = boardSize * boardSize;
		if moves.count < maxMoves {
			var newMoves = moves.map({(value: Move) -> Move in return Move(playerId: value.playerId, position: value.position, marker: value.marker)});
			newMoves.append(move);
			return newMoves;
		}
		return moves;
	}
}
