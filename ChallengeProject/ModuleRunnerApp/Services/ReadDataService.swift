//
//  ReadDataServiceProtocol.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol ReadDataServiceProtocol {
	func getStore() -> DataStore;
}

class ReadDataService: ReadDataServiceProtocol {
	var dataService: DataServiceProtocol;
	
	init(dataService: DataServiceProtocol) {
		self.dataService = dataService;
	}
	
	func getStore() -> DataStore {
		return self.dataService.getStore();
	}
}
