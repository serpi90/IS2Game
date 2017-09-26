tests - positions
testPositionForWhenMoving

	| game position newPosition |

	game := IS2Game
		withBoardOfLength: 5
		laps: 3
		dices: (Dice withSides: 6)
		for: {bob}.
	position := PlayerPosition startingOf: bob.
	newPosition := game positionFor: position whenMoving: 2.
	self assert: newPosition tileNumber equals: 3.
	self assert: newPosition lap equals: 0.
	newPosition := game positionFor: position whenMoving: 6.
	self assert: newPosition tileNumber equals: 2.
	self assert: newPosition lap equals: 1.

	position := PlayerPosition of: bob onLap: 3 tileNumber: 4.
	newPosition := game positionFor: position whenMoving: 1.
	self assert: newPosition tileNumber equals: 5.
	self assert: newPosition lap equals: 3.
	newPosition := game positionFor: position whenMoving: 2.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 4