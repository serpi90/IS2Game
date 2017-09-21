tests
testPlayerLandingOnMoonwalkTileForcesAllPlayersToGoBackANumberOfTiles

	| game bob tiles mary |

	tiles := Array new: 10 withAll: EmptyTile new.
	tiles at: 6 put: (MoonWalktile goingBack: 3).
	tiles at: 2 put: (MoonWalktile goingBack: 1).
	bob := 'Bob'.
	mary := 'Mary'.
	game := IS2Game
		withBoard: (Board withTiles: tiles)
		laps: 3
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: #(4 3 1 1)))
		for: (Array with: bob with: mary).
	game throwDiceFor: bob.
	game throwDiceFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: 4.
	self assert: (game positionOf: mary) tileNumber equals: 3.
	game throwDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 4 + 1 - 3.
	self assert: (game positionOf: mary) tileNumber equals: 3 - 3.
	game throwDiceFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: 4 + 1 - 3 - 1.
	self assert: (game positionOf: mary) tileNumber equals: 3 - 3 + 1 - 1