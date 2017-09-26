tests - tiles
testPlayerLandingOnTimeMachineTileWithNotEnoughHistoryGoesBackToFirstTurnPosition

	| game tiles |

	tiles := (1 to: 10) collect: [ :e | Tile empty ].
	tiles at: 2 put: (Tile withEffect: Effect timeMachine).

	game := self gameWithTiles: tiles.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1