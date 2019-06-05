# ModuleRunnerApp

## Description
A command line application that runs the game Tic Tac Toe. Follow the instructions below to build, test and run the app.

## Install Instructions
The project requires the use of `xcodebuild`
1. Install command line tools for MacOS: `xcode-select --install`.
2. Install the newest version of XCode.
3. Check for MacOS system updates.
4. Navigate to ./ChallengeProject directory that contains the ModuleRunnerApp xcode project.

## Build Instructions
Inside the project directory run the following command to build the project.
```xcodebuild -scheme ModuleRunnerApp  SYMROOT="./{BuildLocation}”```

## Test Instructions
Inside the project directory run the following command to run tests.
```xcodebuild test -scheme ModuleRunnerApp```

## Run Instructions
Run the program by calling the build executable that was created at the build location specified.
```/{BuildLocation}/Debug/ModuleRunnerApp```
