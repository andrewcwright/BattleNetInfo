# BattleNetInfo

This is a project for the Nashville Software School. My objective is to create a command line application to query battle.net for information and store it.

## Table of contents

1. [Purpose](#purpose)
2. [Project Status](#project-status)
3. [Todo List](#todo-list)
4. [Features](#features)
5. [Usage](#usage)

[Acknowledgements](#acknowledgements)

[License](#license)


<a name="purpose"></a>
## 1. Purpose

Battle.net is a server used by Blizzard Entertainment to host video games and provide information about the players. This application is designed to access the Battle.net API and store/display that information. The user will be able to pull pertinent information on a character from any server, and have it displayed in the shell. The idea here is that one can find useful information about someone they encounter in the game quickly, and use it to their advantage. I will also implement the ability to track a player's progression through the course of the game, displaying the information with ASCII characters resembling a graph. This will provide an easy way to figure out if certain content has been completed in the game without having to navigate through several web pages. 

<a name="project-status"></a>
## 2. Project Status

Finished initial functionality of being bale to find basic information on any player.

<a name="todo-list"></a>
## 3. Todo List

* Research WoW api
* Install/research rails and active record
* Write initial tests
* Write initial code to pull data from the api and print it to the screen

<a name="Features"></a>
## 4. Features
* Lookup a character on any server and get some basic information printed to the screen

<a name="Usage"></a>
## 5. Usage

* From BattleNetInfo directory type `ruby bni.rb <character> <server>`
* Capitalize the first letter in character name
* Server is all lowercase

<a name="license"></a>
## License

Copyright (c) 2013 Andrew Wright

Permission is hereby granted, free of charge, to any person obtaining a copy of this software and associated documentation files (the "Software"), to deal in the Software without restriction, including without limitation the rights to use, copy, modify, merge, publish, distribute, sublicense, and/or sell copies of the Software, and to permit persons to whom the Software is furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY, FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM, OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE SOFTWARE.