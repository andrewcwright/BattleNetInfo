User Stories of BattleNetInfo
=============================

<hr />

As a player<br />
In order to research the statistics of my own charcter<br />
I want to be able to access my statistics quickly 

  - user can type `bni` in the command line to get prompted for server and charcter name
  - program will print a list of available servers when prompting the player for one.
  - user runs `bni <character name> <server>` to pass them directly
  - user is then shown a list of statistics pulled down from the battle.net API

<hr />

As a player<br />
In order to discover information about another player<br />
I want to look them up

  - Should work for any player, on any server.

<hr />

As a player<br />
In order to save player information for future use<br />
I want to store the data locally

  - program automatically saves information on viewed characters
  - any subsequent information about the same character should be added to the initially created object
  - this will take all the JSON data and store it locally with Active Record
  - user runs `bni list` to see a list of currently stored characters

As a player<br />
In order to figure out how much content I have cleared<br />
I want to see a graph displaying completed objectives in the game

  - user runs `bni <character name> <server> progression`
  - Their should be a series of rows displaying the name of the objective, and ASCII characters displaying the status of completion
  - This information will be added to an existing character object if it already exists

<hr />

As a player<br />
In order to figure out my progression through the game over time<br />
I want to see a visual representation of my progress

  - represented as a line of characters, with different symbols representing the newly completed tasks
  - pull data from the API, and then compare it to the existing data stored locally.
  - different characters will be used to display previous/newly completed tasks.
  - example: "Throne of Thunder - 6/13 - ####**......"
  - "Throne of Thunder" is the name of the area
  - "6/13 refers to the number of bosses in that area"
  - the #'s represent the amount of bosses killed based on the previous data
  - the *'s represent newly vanquished foes
