tests - tiles
testPlayerLandingOnSpeedUpTileAdvances4Positions

	| game tiles |

	tiles := (1 to: 10) collect: [ :e | Tile empty ].
	tiles at: 2 put: (Tile withEffect: Effect speedUp).

	game := self gameWithTiles: tiles.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 6.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 7.
	self assert: (game positionOf: bob) lap equals: 0