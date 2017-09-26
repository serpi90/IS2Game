tests - tiles
testPlayerLandingOnWormholeTileGoesBack4Positions

	| game tiles |

	tiles := (1 to: 10) collect: [ :e | Tile empty ].
	tiles at: 6 put: self wormholeTile.

	game := self gameWithTiles: tiles rolling: #(4 1) for: {bob}.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: bob) lap equals: 0.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	self assert: (game positionOf: bob) lap equals: 0