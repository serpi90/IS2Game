tests - cards
testSpeedCardAffectsTheThrowBeforeApplyingTileEffect

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 3 put: (Tile withEffect: Effect speedUp).
	game := self gameWithTiles: tiles rolling: #(1) for: {bob}.
	game playCard: PermanentCard speed for: bob over: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 7.	"1(current) + 1(roll) + 1(speed) + 4(SpeedUp)"
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 9	"5(current) + 1(roll) + 1(speed)"