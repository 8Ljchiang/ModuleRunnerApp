//
//  main.swift
//  ModuleRunnerApp
//
//  Created by Jonathan Chiang on 5/26/19.
//  Copyright © 2019 chiangj. All rights reserved.
//

import Foundation

let store = DataStore();
let dataService = DataService(dataStore: store);

let writeDataService = WriteDataService(dataService: dataService);
let readDataService = ReadDataService(dataService: dataService);

let consolePresenterService = ConsolePresenterService();
let consoleInputService = ConsoleInputService();

let t3CommandHandlerResolver = CommandHandlerResolver();
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3Display,
	commandHandler: T3DisplayCommandHandler());
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3DisplayClear,
	commandHandler: T3DisplayClearCommandHandler());
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3UpdateData,
	commandHandler: T3UpdateDataCommandHandler(writeDataService: writeDataService));
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3Welcome,
	commandHandler: T3GameWelcomeCommandHandler());
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3Rules,
	commandHandler: T3GameRulesCommandHandler());
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3PromptForReady,
	commandHandler: T3PromptForReadyCommandHandler());
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3GameInfo,
	commandHandler: T3GameInfoCommandHandler(readDataService: readDataService));
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3GameAvailablePositions,
	commandHandler: T3GameAvailablePositionsCommandHandler(readDataService: readDataService));
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3GameEndInfo,
	commandHandler: T3GameEndInfoCommandHandler(readDataService: readDataService));
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3ReplayInstructions,
	commandHandler: T3ReplayInstructionsCommandHandler());
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3PromptForReplay,
	commandHandler: T3PromptForReadyCommandHandler());
t3CommandHandlerResolver.addHandler(
	type: CommandType.T3PromptForPosition,
	commandHandler: T3PromptForPositionCommandHandler(readDataService: readDataService));


let commandDispatcher = CommandDispatcher(resolver: t3CommandHandlerResolver);

let t3GameModule = GameModule(commandDispatcher: commandDispatcher);

let moduleRunner = ModuleRunner(
	presenterService: consolePresenterService,
	inputService: consoleInputService);

moduleRunner.run(gameModule: t3GameModule);
