tests
testWhenChangingLap

	| board position |

	board := Board withTiles: (Array new: 10 withAll: EmptyTile new).
	position := PlayerPosition of: player onLap: 0 tileNumber: 9.
	self assert: (position positionWhenMoving: 1 on: board) tileNumber equals: 0.
	self assert: (position positionWhenMoving: 1 on: board) lap equals: 1.

	position := PlayerPosition of: player onLap: 0 tileNumber: 4.
	self assert: (position positionWhenMoving: 21 on: board) tileNumber equals: 5.
	self assert: (position positionWhenMoving: 21 on: board) lap equals: 2.

	position := PlayerPosition of: player onLap: 2 tileNumber: 5.
	self assert: (position positionWhenMoving: 5 on: board) tileNumber equals: 0.
	self assert: (position positionWhenMoving: 5 on: board) lap equals: 3