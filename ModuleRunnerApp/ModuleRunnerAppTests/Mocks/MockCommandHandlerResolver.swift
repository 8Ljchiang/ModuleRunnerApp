//
//  MockCommandHandlerResolver.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockCommandHandlerResolver: CommandHandlerResolverProtocol {
	var getHandlerCallCount: Int = 0;
	
	func getHandler(_ commandType: CommandType) -> CommandHandlerProtocol {
		self.getHandlerCallCount += 1;
		return MockCommandHandler();
	}
}
