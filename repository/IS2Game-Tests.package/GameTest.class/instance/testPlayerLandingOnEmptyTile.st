tests
testPlayerLandingOnEmptyTile

	| game bob tiles |

	tiles := Array new: 10 withAll: EmptyTile new.

	bob := 'Bob'.
	game := IS2Game
		withBoard: (Board withTiles: tiles)
		laps: 3
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: #(1)))
		for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 0.
	self assert: (game positionOf: bob) lap equals: 0.
	game throwDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0