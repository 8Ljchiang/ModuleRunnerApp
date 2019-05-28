//
//  CommandBuilder.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class CommandBuilder {
	static func displayCommand(_ text: String?) -> CommandProtocol {
		let payloadText = text ?? "";
		let payload: [String: Any] = ["text": payloadText];
		return Command(type: CommandType.T3Display, payload: payload);
	}
	
	static func welcomeCommand() -> CommandProtocol {
		let payload: [String: Any] = [:];
		let welcomeCommand = Command(type: CommandType.T3Welcome, payload: payload);
		return welcomeCommand;
	}
}
