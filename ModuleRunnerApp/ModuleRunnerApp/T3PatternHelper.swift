//
//  T3PatternHelper.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3PatternHelper {
	static func getRowPatterns(boardSize: Int) -> [[Int]] {
		var patterns: [[Int]] = Array();
		for rowIndex in 0..<boardSize {
			var rowPattern: [Int] = Array();
			for index in 1...boardSize {
				let verticalOffset = rowIndex * boardSize;
				rowPattern.append(index + verticalOffset);
			}
			patterns.append(rowPattern);
		}
		return patterns;
	}
	
	static func getColumnPatterns(boardSize: Int) -> [[Int]] {
		var patterns: [[Int]] = Array();
		for columnIndex in 1...boardSize {
			var columnPattern: [Int] = Array();
			for index in 0..<boardSize {
				let verticalOffset = index * boardSize;
				columnPattern.append(columnIndex + verticalOffset);
			}
			patterns.append(columnPattern);
		}
		return patterns;
	}
}
