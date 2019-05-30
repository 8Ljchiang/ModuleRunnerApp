//
//  T3PlayerHelper.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3PlayerHelper {
	static func cycleActivePlayerIndex(currentIndex: Int, playerCount: Int) -> Int {
		return currentIndex + 1;
	}
}
