//
//  Command.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol CommandProtocol {
	var type: CommandType { get };
	var payload: Any { get };
}

class Command: CommandProtocol {
	var type: CommandType;
	var payload: Any;
	
	init(type: CommandType, payload: Any) {
		self.type = type;
		self.payload = payload;
	};
}
