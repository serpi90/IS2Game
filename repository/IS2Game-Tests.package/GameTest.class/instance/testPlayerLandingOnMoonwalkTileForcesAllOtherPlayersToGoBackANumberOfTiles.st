tests - tiles
testPlayerLandingOnMoonwalkTileForcesAllOtherPlayersToGoBackANumberOfTiles

	| game tiles positionForBob positionForMary |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile numbered: 2 withEffect: (Effect moonwalkGoingBack: 2)).
	tiles at: 6 put: (Tile numbered: 6 withEffect: (Effect moonwalkGoingBack: 3)).

	game := self gameWithTiles: tiles rolling: #(4 3 1 1) for: (Array with: bob with: mary).
	game playTurnFor: bob.
	game playTurnFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: 5.
	self assert: (game positionOf: mary) tileNumber equals: 4.
	positionForBob := game positionOf: bob.
	positionForMary := game positionOf: mary.
	game playTurnFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: positionForBob tileNumber + 1.
	self assert: (game positionOf: mary) tileNumber equals: positionForMary tileNumber - 3.
	positionForBob := game positionOf: bob.
	positionForMary := game positionOf: mary.
	game playTurnFor: mary.
	self assert: (game positionOf: bob) tileNumber equals: positionForBob tileNumber - 2.
	self assert: (game positionOf: mary) tileNumber equals: positionForMary tileNumber + 1