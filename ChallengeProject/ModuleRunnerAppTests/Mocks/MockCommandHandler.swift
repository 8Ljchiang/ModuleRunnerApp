//
//  MockCommandHandler.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockCommandHandler: CommandHandlerProtocol {
	func execute(_ command: CommandProtocol, module: GameModuleProtocol) -> CommandHandlerResponseProtocol {
		return CommandHandlerResponse();
	}
}
