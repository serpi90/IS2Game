tests - tiles
testPlayerLandingOnMoonwalkTileForcesAllOtherPlayersToGoBackANumberOfTiles

	| game tiles positionForBob positionForMary |

	tiles := (1 to: 10) collect: [ :e | Tile empty ].
	tiles at: 6 put: (self moonwalkTileGoingBack: 3).
	tiles at: 2 put: (self moonwalkTileGoingBack: 2).

	game := self
		gameWithTiles: tiles
		rolling: #(4 3 1 1)
		for: (Array with: bob with: mary).
	game playTurnFor: bob.
	game playTurnFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: mary) tileNumber equals: 4.
	positionForBob := game positionOf: bob.
	positionForMary := game positionOf: mary.
	game playTurnFor: bob.
	self
		assert: (game positionOf: bob) tileNumber
		equals: positionForBob tileNumber + 1.
	self
		assert: (game positionOf: mary) tileNumber
		equals: positionForMary tileNumber - 3.
	positionForBob := game positionOf: bob.
	positionForMary := game positionOf: mary.
	game playTurnFor: mary.
	self
		assert: (game positionOf: bob) tileNumber
		equals: positionForBob tileNumber - 2.
	self
		assert: (game positionOf: mary) tileNumber
		equals: positionForMary tileNumber + 1