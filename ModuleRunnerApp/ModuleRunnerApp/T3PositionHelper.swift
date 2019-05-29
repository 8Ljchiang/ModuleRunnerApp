//
//  T3PositionHelper.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/29/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3PositionHelper {
	static func isPositionAvailable(position: Int, moves: [Move], boardSize: Int) -> Bool {
		let maxPosition = boardSize * boardSize;
		
		guard position > 0 && position <= maxPosition else {
			return false;
		}
		
		let filteredMoves = moves.filter({(value: Move) -> Bool in return value.position == position});
		
		if filteredMoves.count > 0 {
			return false;
		} else {
			return true;
		}
	}
	
	static func getAvailablePositions(moves: [Move], boardSize: Int) -> [Int] {
		var resultPositions: [Int] = Array();
		let maxPosition = boardSize * boardSize;
		
		for position in 1...maxPosition {
			let filteredMoves = moves.filter({(value: Move) -> Bool in return value.position == position});
			if filteredMoves.count == 0 {
				resultPositions.append(position);
			}
		}
		
		return resultPositions;
	}
	
	static func getPositionsForMarker(moves: [Move], marker: String) -> [Int] {
		let resultPositions = moves
			.filter({(value: Move) -> Bool in return value.marker == marker})
			.map({(value: Move) -> Int in return value.position});
		
		return resultPositions;
	}
	
	static func isValidInputForPosition(_ input: String, moves: [Move], boardSize: Int) -> Bool {		
		guard let position = Int(input) else { return false };
		
		return isPositionAvailable(position: position, moves: moves, boardSize: boardSize);
	}
	
	private static func isParsableAsInt(text: String) -> Bool {
		return Int(text) != nil;
	}
}
