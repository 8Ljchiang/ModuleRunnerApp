//
//  T3PatternHelper.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/30/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3PatternHelper {
	static func getWinningPatterns (boardSize: Int) -> [[Int]] {
		let rowPatterns = getRowPatterns(boardSize: boardSize);
		let columnPatterns = getColumnPatterns(boardSize: boardSize);
		let diagPatterns = getDiagonalPatterns(boardSize: boardSize);
		
		let combinedPatterns = rowPatterns + columnPatterns + diagPatterns;
		return combinedPatterns;
	}
	
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
	
	static func getDiagonalPatterns(boardSize: Int) -> [[Int]] {
		var patterns: [[Int]] = Array();
		
		var diagPattern1: [Int] = Array();
		for index in 1...boardSize {
			let offset = boardSize * (index - 1);
			diagPattern1.append(index + offset);
		}
		patterns.append(diagPattern1);
		
		var diagPattern2: [Int] = Array();
		for index in 1...boardSize {
			let offset = (boardSize - 1) * (index);
			diagPattern2.append(1 + offset);
		}
		patterns.append(diagPattern2);
		
		return patterns;
	}
}
