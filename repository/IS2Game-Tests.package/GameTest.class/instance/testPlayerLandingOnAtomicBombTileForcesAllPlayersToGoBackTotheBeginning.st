tests - tiles
testPlayerLandingOnAtomicBombTileForcesAllPlayersToGoBackTotheBeginning

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 6 put: (Tile withEffect: Effect atomicBomb).
	game := self
		gameWithTiles: tiles
		rolling: #(4 4 1)
		for: (Array with: bob with: mary).
	game rollDiceFor: bob.
	game rollDiceFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 5.
	self assert: (game positionOf: mary) lap equals: 0.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 1.
	self assert: (game positionOf: mary) lap equals: 0