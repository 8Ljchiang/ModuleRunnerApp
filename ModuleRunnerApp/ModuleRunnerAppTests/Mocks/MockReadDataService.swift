//
//  MockReadDataService.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockReadDataService: ReadDataServiceProtocol {
	var store: DataStore;
	
	init(dataStore: DataStore) {
		self.store = dataStore;
	}
	
	func getStore() -> DataStore {
		return self.store;
	}
}
