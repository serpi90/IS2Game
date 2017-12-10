tests - cards
testCushioningCardHalvesTileEffectsOfWormhole

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: Effect wormhole).

	game := self gameWithTiles: tiles rolling: #(1) for: {bob}.
	game playCard: PermanentCard cushioning for: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 10.	"1(current) + 1(roll) - 4(wormhole)/2(softening)"
	self assert: (game positionOf: bob) lap equals: -1