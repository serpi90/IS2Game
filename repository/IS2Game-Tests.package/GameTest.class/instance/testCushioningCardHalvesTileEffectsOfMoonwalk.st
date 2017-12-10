tests - cards
testCushioningCardHalvesTileEffectsOfMoonwalk

	| game tiles |

	tiles := self emptyTiles: 10.
	tiles at: 2 put: (Tile withEffect: (Effect moonwalkGoingBack: 2)).

	game := self
		gameWithTiles: tiles
		rolling: #(1)
		for: (Array with: bob with: mary).
	game playCard: PermanentCard cushioning for: bob.
	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.	"1(current) + 1(roll)"
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 10.	"1(current) - 2(moonwalk)/2(softening)"
	self assert: (game positionOf: mary) lap equals: -1