//
//  CommandLogger.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol CommandLoggerProtocol {
	func logCommand(_ command: CommandProtocol);
}

class CommandLogger: CommandLoggerProtocol {
	var presenterService: PresenterServiceProtocol;
	var isDisplayOn: Bool;
	
	init(presenterService: PresenterServiceProtocol, isDisplayOn: Bool) {
		self.presenterService = presenterService;
		self.isDisplayOn = isDisplayOn;
	}
	
	func logCommand(_ command: CommandProtocol) {
		
	}
}
