//
//  DataService.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

struct DataStore: Equatable {
	var activePlayerIndex: Int = 0;
	var players: [String] = Array();
	var moves: [Int] = Array();
}

protocol DataServiceProtocol {
	func getStore() -> DataStore;
	func setStore(store: DataStore);
}

class DataService: DataServiceProtocol {
	var dataStore: DataStore;
	
	init() {
		self.dataStore = DataStore();
	}
	
	func getStore() -> DataStore {
		return self.dataStore;
	}
	
	func setStore(store: DataStore) {
		self.dataStore = store;
	}
}
