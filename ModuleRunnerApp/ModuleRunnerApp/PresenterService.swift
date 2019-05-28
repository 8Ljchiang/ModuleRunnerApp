//
//  PresenterService.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol PresenterServiceProtocol {
	func display(_ text: String);
	func clearDisplay();
}

class ConsolePresenterService: PresenterServiceProtocol {
	init() {}
	
	func display(_ text: String) {
		print(text);
	}
	
	func clearDisplay() {
		print("\u{001B}[2J");
	}
}
