//
//  CommandHandlerResponse.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/27/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol CommandHandlerResponseProtocol {
	var commands: [CommandProtocol] { get };
	var errors: [String] { get };
	
	func addCommand(_ command: CommandProtocol);
	func addError(_ error: String);
}

class CommandHandlerResponse: CommandHandlerResponseProtocol {
	var commands: [CommandProtocol] = Array();
	var errors: [String] = Array();
	
	init() {}
	
	func addCommand(_ command: CommandProtocol) {
		self.commands.append(command);
	}
	
	func addError(_ error: String) {
		self.errors.append(error);
	}
}
