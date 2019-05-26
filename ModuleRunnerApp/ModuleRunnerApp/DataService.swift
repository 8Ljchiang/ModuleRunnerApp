//
//  DataService.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

struct DataStorePartial {
	var activePlayerIndex: Int?;
	var players: [String]?;
	var moves: [Move]?;
}

struct DataStore: Equatable {
	var activePlayerIndex: Int = 0;
	var players: [String] = Array();
	var moves: [Move] = Array();
}

protocol DataServiceProtocol {
	func getStore() -> DataStore;
	func setStore(store: DataStore);
	func updateStore(partialStore: DataStorePartial);
}

class DataService: DataServiceProtocol {
	var dataStore: DataStore;
	
	init() {
		let newStore = DataStore();
		self.dataStore = newStore;
	}
	
	func getStore() -> DataStore {
		return self.dataStore;
	}
	
	func setStore(store: DataStore) {
		self.dataStore = store;
	}
	
	func updateStore(partialStore: DataStorePartial) {
		self.dataStore = mergeStore(partialStore: partialStore);
	}
	
	private func mergeStore(partialStore: DataStorePartial) -> DataStore {
		var newStore = DataStore();
		newStore.activePlayerIndex = partialStore.activePlayerIndex ?? self.dataStore.activePlayerIndex;
		newStore.moves = partialStore.moves ?? self.dataStore.moves;
		newStore.players = partialStore.players ?? self.dataStore.players;
		
		return newStore;
	}
}
