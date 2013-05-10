# BattleNetInfo

This is a project for the Nashville Software School. My objective is to create a command line application to query battle.net for information and store it.

## Table of contents

1. [Purpose](#purpose)
2. [Project Status](#project-status)
3. [Todo List](#todo-list)
4. [Features](#features)
5. [Usage](#usage)
6. [User Stories](#user-stories)

[Acknowledgements](#acknowledgements)

[License](#license)


<a name="purpose"></a>
## 1. Purpose

Battle.net is a server used by Blizzard Entertainment to host video games and provide information about the players. This application is designed to access their API and store/display that information. The user will be able to pull pertinent information on a character from any server, and have it displayed in the shell. The idea here is that one can find useful information about someone they encounter in the game quickly, and use it to their advantage. I will also implement the ability to track a player's progression through the course of the game, displaying the information with ASCII characters resembling a graph. This will provide an easy way to figure out if certain content has been completed in the game without having to navigate through several web pages. 

<a name="project-status"></a>
## 2. Project Status

Completed the README and some user stories

<a name="todo-list"></a>
## 3. Todo List

* Research WoW api
* Install/research rails and active record
* Write initial tests
* Write initial code to pull data from the api and print it to the screen

<a name="Features"></a>
## 4. Features

<a name="Usage"></a>
## 5. Usage

<a name="user-stories"></a>
## 6. User Stories

* As a player, wanting to research my own stats, I want to look them up quickly. Should work by providing a name/server combination passed as arguements through the commandline
* As a player, wanting to discover information about another player, I want to look them up. Should work for any player, on any server.
* As a player, wanting to figure out how much content I have cleared, I want to see a graph displaying completed objectives in the game. Their should be a series of rows displaying the name of the objective, and ASCII characters displaying the status of completion. This information will be stored for future use.
* As a player, wanting to figure out my progression through the game over time, I want to see a visual representation of my progress over time. This could be represented as a line of characters, with different characters representing the newly completed tasks. It can pull data from the API, and then compare it to the existing data stoed locally. Different character will be used to display previous/newly completed tasks.