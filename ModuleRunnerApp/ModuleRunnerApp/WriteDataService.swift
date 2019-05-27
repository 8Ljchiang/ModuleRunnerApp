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
