//
//  MockDataService.swift
//  ModuleRunnerAppTests
//
//  Created by Jonathan Chiang on 5/27/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockDataService: DataServiceProtocol {
	var isGetStoreCalled = false;
	var isSetStoreCalled = false;
	var isUpdateStoreCalled = false;
	
	var setStoreCalledWith: DataStore?;
	var updateStoreCalledWith: [String: Any]?;
	
	func getStore() -> DataStore {
		self.isGetStoreCalled = true;
		return DataStore();
	}
	
	func setStore(store: DataStore) {
		self.isSetStoreCalled = true;
		self.setStoreCalledWith = store;
	}
	
	func updateStore(_ partialData: [String : Any]) {
		self.isUpdateStoreCalled = true;
		self.updateStoreCalledWith = partialData;
	}
}
