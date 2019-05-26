//
//  Command.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol CommandProtocol {
	var type: String { get };
	var payload: Any { get };
}
