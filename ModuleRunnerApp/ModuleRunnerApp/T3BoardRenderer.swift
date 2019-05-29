//
//  T3BoardRenderer.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/28/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

class T3BoardRenderer {
	static let POSITION_OFFSET = 1;
	static let DEFAULT_CELL_WIDTH = 9;
	
	static func render(_ moves: [Move], boardSize: Int) -> String {
		let boardString = renderHelper(moves, boardSize: boardSize);
		return boardString;
	}
	
	static private func renderHelper(_ moves: [Move], boardSize: Int) -> String {
		var boardRowsCache: [String] = Array();
		var lineCache: [String] = Array();
		let positionData = getPositionData(moves, boardSize: boardSize);
		
		for index in 0..<positionData.count {
			let position = adjustIndexToPosition(index);
			if (position % boardSize) == 0 {
				lineCache.append("\(createBoardLine(positionData[index]))\n");
				boardRowsCache.append(createBoardRow(lineCache, boardSize: boardSize));
				lineCache = Array();
			} else {
				lineCache.append(createBoardLine(positionData[index]));
			}
		}
		
		let horizontalDivider = makeHorizontalDivider(boardSize: boardSize);
		let finalResult = boardRowsCache.joined(separator: horizontalDivider);
		print(finalResult);
		return finalResult;
	}

	static private func createBoardRow(_ lines: [String], boardSize: Int) -> String {
		return String(createManyNonlineRows(1, boardSize: boardSize)) + String(lines.joined(separator: "|")) + String(createManyNonlineRows(1, boardSize: boardSize));
	}
	
	static private func makeHorizontalDivider(boardSize: Int) -> String {
		return createLineRow(boardSize: boardSize);
	}
	
	static private func createManyNonlineRows(_ count: Int, boardSize: Int) -> String {
		var fill: String = "";
		if count > 0 {
			for _ in 1...count {
				fill = fill + String(createNonlineRow(boardSize: boardSize));
			}
		}
		return fill;
	}
	
	static private func createLineRow(boardSize: Int) -> String {
		let rowLength = (boardSize * DEFAULT_CELL_WIDTH) + boardSize - 1
		var rowLine = "";
		for index in 0..<rowLength {
			if index < rowLength - 1 {
				rowLine = rowLine + String("-");
			} else {
				rowLine = rowLine + String("-\n");
			}
		}
		return rowLine;
	}
	
	static private func createNonlineRow(boardSize: Int) -> String {
		var rowLine = "";
		for index in 0..<boardSize {
			if index < boardSize - 1 {
				rowLine = rowLine + String(makeSpaceBuffer(9)) + String("|");
			} else {
				rowLine = rowLine + String(makeSpaceBuffer(9)) + String("\n");
			}
		}
		return rowLine;
	}
	
	static private func createBoardLine(_ positionValue: String) -> String {
		return "\(makeSpaceBuffer(4))\(positionValue)\(makeSpaceBuffer(4))";
	}
	
	static private func makeSpaceBuffer(_ count: Int) -> String {
		var buffer: String = "";
		for _ in 1...count {
			buffer = buffer + String(" ");
		}
		return buffer;
	}
	
	static private func getPositionData(_ moves: [Move], boardSize: Int) -> [String] {
		let maxPosition = boardSize * boardSize;
		var positionValues: [String] = Array();
		for position in 1...maxPosition {
			positionValues.append(T3Text.openSpace);
		}
		return positionValues;
	}
	
	static private func adjustIndexToPosition(_ index: Int) -> Int {
		return index + POSITION_OFFSET;
	}
}
