tests - positions
testPlayerStartsAtPositionAndLapZero

	| game |

	game := self gameWithBoardLength: 10 for: (Array with: bob with: mary).
	self assert: (game positionOf: bob) lap equals: 0.
	self assert: (game positionOf: bob) tileNumber equals: 1.
	self assert: (game positionOf: mary) lap equals: 0.
	self assert: (game positionOf: mary) tileNumber equals: 1