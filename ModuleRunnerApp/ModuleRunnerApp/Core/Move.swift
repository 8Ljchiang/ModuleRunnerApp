//
//  Move.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class Move: Equatable {
	static func == (lhs: Move, rhs: Move) -> Bool {
		return lhs.marker == rhs.marker
			&& lhs.playerId == rhs.playerId
			&& lhs.position == rhs.position;
	}
	
	let playerId: String;
	let position: Int;
	let marker: String;
	
	init(playerId: String, position: Int, marker: String) {
		self.playerId = playerId;
		self.marker = marker;
		self.position = position;
	}
}
