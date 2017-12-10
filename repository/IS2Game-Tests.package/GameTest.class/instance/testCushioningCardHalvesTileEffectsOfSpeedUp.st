tests - cards
testCushioningCardHalvesTileEffectsOfSpeedUp

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: Effect speedUp).

	game := self gameWithTiles: tiles rolling: #(1) for: {bob}.
	game playCard: PermanentCard cushioning for: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 4	"1(current) + 1(roll) + 4(speedUp)/2(softening)"