//
//  DataStore.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

struct DataStorePartial {
	var activePlayerIndex: Int?;
	var players: [String]?;
	var moves: [Move]?;
}

struct DataStore {
	var data: [String: Any] = [:];
}
