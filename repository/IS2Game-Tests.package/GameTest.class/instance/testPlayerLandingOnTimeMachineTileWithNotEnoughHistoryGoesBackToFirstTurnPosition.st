tests - tiles
testPlayerLandingOnTimeMachineTileWithNotEnoughHistoryGoesBackToFirstTurnPosition

	| game bob tiles |

	tiles := (1 to: 10) collect: [ :e | Tile empty ].
	tiles at: 4 put: self timeMachineTile.

	bob := 'Bob'.
	game := IS2Game
		withBoard: (Board withTiles: tiles)
		laps: 3
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: #(3)))
		for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 0