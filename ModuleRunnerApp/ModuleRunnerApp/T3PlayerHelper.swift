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
		if currentIndex < playerCount - 1 {
			return currentIndex + 1;
		} else {
			return 0;
		}
	}
}
