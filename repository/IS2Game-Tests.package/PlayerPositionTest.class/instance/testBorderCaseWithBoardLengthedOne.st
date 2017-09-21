tests
testBorderCaseWithBoardLengthedOne

	| position board |

	position := PlayerPosition startingOf: player.
	board := Board withTiles: {EmptyTile new}.
	self assert: (position positionWhenMoving: 1 on: board) tileNumber equals: 0.
	self assert: (position positionWhenMoving: 1 on: board) lap equals: 1.
	self assert: (position positionWhenMoving: 2 on: board) tileNumber equals: 0.
	self assert: (position positionWhenMoving: 2 on: board) lap equals: 2