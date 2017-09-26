tests - positions
testPositionForBorderCaseWithBoardLengthedOne

	| position game newPosition |

	game := IS2Game
		withBoardOfLength: 1
		laps: 5
		dices: (Dice withSides: 6)
		for: {bob}.

	position := PlayerPosition startingOf: bob.
	newPosition := game positionFor: position whenMoving: 1.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 1.

	newPosition := game positionFor: position whenMoving: 2.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 2