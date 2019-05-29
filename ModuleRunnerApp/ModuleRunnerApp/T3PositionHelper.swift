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
}
