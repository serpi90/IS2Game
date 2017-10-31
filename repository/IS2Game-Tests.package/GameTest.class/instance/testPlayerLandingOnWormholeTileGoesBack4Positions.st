tests - tiles
testPlayerLandingOnWormholeTileGoesBack4Positions

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 6 put: (Tile numbered: 6 withEffect: Effect wormhole).

	game := self gameWithTiles: tiles rolling: #(4 1) for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: bob) lap equals: 0.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	self assert: (game positionOf: bob) lap equals: 0