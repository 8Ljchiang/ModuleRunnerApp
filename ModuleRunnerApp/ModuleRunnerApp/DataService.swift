//
//  DataService.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol DataServiceProtocol {
	func getStore() -> DataStore;
	func setStore(store: DataStore);
	func updateStore(_ partialData: [String: Any]);
}

class DataService: DataServiceProtocol {
	var dataStore: DataStore;
	
	init(dataStore: DataStore) {
		self.dataStore = dataStore;
	}
	
	func getStore() -> DataStore {
		return self.dataStore;
	}
	
	func setStore(store: DataStore) {
		self.dataStore = store;
	}
	
	func updateStore(_ partialData: [String: Any]) {
		mergeData(partialData);
	}
	
	func mergeData(_ partialData: [String: Any]) {
		let currentStoreKeys: Set<String> = Set(self.dataStore.data.keys);
		let partialDataKeys: Set<String> = Set(partialData.keys);
		let uniqueKeys: Set<String> = currentStoreKeys.union(partialDataKeys);
		
		for key in uniqueKeys {
			let value = partialData[key];
			if (value != nil) {
				self.dataStore.data[key] = value;
			}
		}
	}
}
