tests
testWhenNotChangingLap

	| calculator board position |

	board := Board withTiles: (Array new: 10 withAll: EmptyTile new).
	position := PlayerPosition startingOf: player.
	self assert: (position positionWhenMoving: 1 on: board) tileNumber equals: 1.
	self assert: (position positionWhenMoving: 1 on: board) lap equals: 0.

	position := PlayerPosition of: player onLap: 2 tileNumber: 4.
	self assert: (position positionWhenMoving: 3 on: board) tileNumber equals: 7.
	self assert: (position positionWhenMoving: 3 on: board) lap equals: 2.

	position := PlayerPosition of: player onLap: 2 tileNumber: 3.
	self assert: (position positionWhenMoving: 5 on: board) tileNumber equals: 8.
	self assert: (position positionWhenMoving: 5 on: board) lap equals: 2