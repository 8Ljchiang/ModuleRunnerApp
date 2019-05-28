//
//  WriteDataService.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/27/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

protocol WriteDataServiceProtocol {
	func updateStore(_ data: [String: Any]);
	func setStore(_ data: [String: Any]);
}

class WriteDataService: WriteDataServiceProtocol {
	var dataService: DataServiceProtocol;
	
	init(dataService: DataServiceProtocol) {
		self.dataService = dataService;
	}
	
	func updateStore(_ data: [String : Any]) {
		self.dataService.updateStore(data);
	}
	
	func setStore(_ data: [String : Any]) {
		let newDataStore = DataStore(data: data);
		self.dataService.setStore(store: newDataStore);
	}
}
