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

let commandDispatcher = CommandDispatcher(resolver: t3CommandHandlerResolver);

let t3GameModule = GameModule(commandDispatcher: commandDispatcher);

let moduleRunner = ModuleRunner(
	presenterService: consolePresenterService,
	inputService: consoleInputService);

moduleRunner.run(gameModule: t3GameModule);
