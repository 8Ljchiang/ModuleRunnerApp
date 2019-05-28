//
//  CommandBuilder.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class CommandBuilder {
	static func welcomeCommand() -> CommandProtocol {
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3Welcome, payload: payload);
		return command;
	}
}
