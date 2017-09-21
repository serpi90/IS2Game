tests
testBorderCaseWithBoardLengthedOne

	| calculator board position |

	calculator := PositionCalculator new.
	board := Board withTiles: {EmptyTile new}.
	position := PlayerPosition of: 'pepe' onLap: 0 tileNumber: 0.
	self assert: (calculator tileNumberWhenMoving: 1 from: position on: board) equals: 0.
	self assert: (calculator lapNumberWhenMoving: 1 from: position on: board) equals: 1.
	self assert: (calculator lapNumberWhenMoving: 2 from: position on: board) equals: 2