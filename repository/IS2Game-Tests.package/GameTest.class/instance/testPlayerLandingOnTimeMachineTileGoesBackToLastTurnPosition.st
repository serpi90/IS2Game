tests - tiles
testPlayerLandingOnTimeMachineTileGoesBackToLastTurnPosition

	| game bob tiles |

	tiles := Array new: 10 withAll: EmptyTile new.
	tiles at: 4 put: TimeMachineTile new.

	bob := 'Bob'.
	game := IS2Game
		withBoard: (Board withTiles: tiles)
		laps: 3
		dice: (Dice withSides: 6 source: (SequentialGenerator generating: #(1 2)))
		for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 0