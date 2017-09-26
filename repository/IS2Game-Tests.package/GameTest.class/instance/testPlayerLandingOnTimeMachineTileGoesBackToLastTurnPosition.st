tests - tiles
testPlayerLandingOnTimeMachineTileGoesBackToLastTurnPosition

	| game tiles |

	tiles := (1 to: 10) collect: [ :e | Tile empty ].
	tiles at: 4 put: self timeMachineTile.

	game := self gameWithTiles: tiles rolling: #(1 2) for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1