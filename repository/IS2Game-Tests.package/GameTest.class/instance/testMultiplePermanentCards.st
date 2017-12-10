tests - cards
testMultiplePermanentCards

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 6 put: (Tile withEffect: Effect speedUp).

	game := self gameWithTiles: tiles rolling: #(4) for: {bob}.
	game playCard: PermanentCard cushioning for: bob.
	game playCard: PermanentCard speed for: bob over: bob.
	game playCard: PermanentCard speed for: bob over: bob.
	game playCard: PermanentCard speed for: bob over: bob.
	game playCard: PermanentCard overload for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 8.	"1(current) + 4(roll) - 2(overload) + 3(speed) + 4(SpeedUp)/2(softening)"
	self assert: (game positionOf: bob) lap equals: 0