//
//  GameModule.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol GameModuleProtocol {
	func start(moduleRunner: ModuleRunnerProtocol);
}

class GameModule: GameModuleProtocol {
	init() {}
	
	func start(moduleRunner: ModuleRunnerProtocol) {
		
	}
}
