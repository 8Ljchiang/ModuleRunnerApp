//
//  MockWriteDataService.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/27/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class MockWriteDataService: WriteDataServiceProtocol {
	var dataService: DataServiceProtocol;
	
	var isUpdateStoreCalled = false;
	var updateStoreCalledWith: [String: Any]?;
	
	var isSetStoreCalled = false;
	var setStoreCalledWith: [String: Any]?;
	
	init(dataService: DataServiceProtocol) {
		self.dataService = dataService;
	}
	
	func updateStore(_ data: [String : Any]) {
		self.isUpdateStoreCalled = true;
		self.updateStoreCalledWith = data;
	}
	
	func setStore(_ data: [String : Any]) {
		self.isSetStoreCalled = true;
		self.setStoreCalledWith = data;
	}
}
