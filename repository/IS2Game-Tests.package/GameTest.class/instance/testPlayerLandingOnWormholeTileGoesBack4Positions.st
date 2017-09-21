tests - tiles
testPlayerLandingOnWormholeTileGoesBack4Positions

	| game bob tiles |

	tiles := Array new: 10 withAll: EmptyTile new.
	tiles at: 6 put: WormholeTile new.

	bob := 'Bob'.
	game := IS2Game
		withBoard: (Board withTiles: tiles)
		laps: 3
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: #(4 1)))
		for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 0.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 4.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0