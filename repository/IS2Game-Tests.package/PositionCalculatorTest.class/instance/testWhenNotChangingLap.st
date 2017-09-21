tests
testWhenNotChangingLap

	| calculator board position |

	calculator := PositionCalculator new.
	board := Board withTiles: (Array new: 10 withAll: EmptyTile new).
	position := PlayerPosition of: 'pepe' onLap: 0 tileNumber: 0.
	self assert: (calculator tileNumberWhenMoving: 1 from: position on: board) equals: 1.
	self assert: (calculator lapNumberWhenMoving: 1 from: position on: board) equals: 0.

	position := PlayerPosition of: 'pepe' onLap: 2 tileNumber: 4.
	self assert: (calculator tileNumberWhenMoving: 3 from: position on: board) equals: 7.
	self assert: (calculator lapNumberWhenMoving: 3 from: position on: board) equals: 2.

	position := PlayerPosition of: 'pepe' onLap: 2 tileNumber: 3.
	self assert: (calculator tileNumberWhenMoving: 5 from: position on: board) equals: 8.
	self assert: (calculator lapNumberWhenMoving: 5 from: position on: board) equals: 2