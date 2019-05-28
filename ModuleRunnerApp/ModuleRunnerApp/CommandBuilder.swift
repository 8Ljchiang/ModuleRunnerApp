//
//  CommandBuilder.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class CommandBuilder {
	static func displayCommand(_ text: String) -> CommandProtocol {
		let payload: [String: Any] = ["text": text];
		let command = Command(type: CommandType.T3Display, payload: payload);
		return command;
	}
	
	static func displayClearCommand() -> CommandProtocol {
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3DisplayClear, payload: payload);
		return command;
	}
	
	static func updateDataCommand(_ data: [String: Any]) -> CommandProtocol {
		let command = Command(type: CommandType.T3UpdateData, payload: data);
		return command;
	}
	
	static func welcomeCommand() -> CommandProtocol {
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3Welcome, payload: payload);
		return command;
	}
	
	static func rulesCommand() -> CommandProtocol {
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3Rules, payload: payload);
		return command;
	}
	
	static func promptForReadyCommand() -> CommandProtocol {
		let payload: [String: Any] = [:];
		let command = Command(type: CommandType.T3PromptForReady, payload: payload);
		return command;
	}
}
