//
//  CommandType.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

enum CommandType {
	case T3Display;
	case T3DisplayClear;
	case T3UpdateData;
	case T3Welcome;
	case T3Rules;
	case T3PromptForReady;
	case T3GameInfo;
	case T3GameAvailablePositions;
	case T3PromptForPosition;
	case T3GameEndInfo;
	case T3PromptForReplay;
}
