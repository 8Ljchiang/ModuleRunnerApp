//
//  InputService.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol InputServiceProtocol {
	func getInput() -> String;
}

class ConsoleInputService: InputServiceProtocol {
	func getInput() -> String {
		let inputText = readLine();
		let result = inputText ?? "";
		return result;
	}
}
