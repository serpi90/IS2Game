tests
testPlayingUntilWinning

	| game |

	game := IS2Game
		withBoard: (Board withTiles: (self emptyTiles: 5))
		laps: 3
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: #(1 2 3 4)))
		for: (Array with: bob with: mary).
	self deny: game hasEnded.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: mary) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 1.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) tileNumber equals: 3.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) lap equals: 1.
	self assert: (game positionOf: mary) tileNumber equals: 2.
	game rollDiceFor: bob.
	game rollDiceFor: mary.
	game rollDiceFor: bob.
	game rollDiceFor: mary.
	game rollDiceFor: bob.
	game rollDiceFor: mary.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) lap equals: 2.
	self assert: (game positionOf: bob) tileNumber equals: 3.
	game rollDiceFor: mary.
	self assert: (game positionOf: mary) lap equals: 3.
	self assert: (game positionOf: mary) tileNumber equals: 4.
	self assert: game hasEnded