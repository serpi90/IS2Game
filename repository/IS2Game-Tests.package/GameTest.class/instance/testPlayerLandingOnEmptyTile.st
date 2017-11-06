tests - tiles
testPlayerLandingOnEmptyTile

	| game tiles |

	tiles := (1 to: 10) collect: [ :n | Tile withoutEffect ].
	game := self gameWithTiles: tiles.

	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: bob) lap equals: 0.

	game rollDiceFor: bob.
	self assert: (game positionOf: bob) tileNumber equals: 2.
	self assert: (game positionOf: bob) lap equals: 0