tests - tiles
testPlayerLandingOnTimeMachineTileGoesBackToLastTurnPosition

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 4 put: (Tile numbered: 4 withEffect: Effect timeMachine).

	game := self gameWithTiles: tiles rolling: #(1 2) for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1