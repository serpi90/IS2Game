tests - positions
testPositionForWhenChangingLap

	| position game player newPosition |

	player := 'bob'.
	game := IS2Game
		withBoardOfLength: 10
		laps: 5
		dices: (Dice withSides: 6)
		for: {player}.
	position := PlayerPosition of: player onLap: 0 tileNumber: 10.
	newPosition := game positionFor: position whenMoving: 1.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 1.

	position := PlayerPosition of: player onLap: 0 tileNumber: 5.
	newPosition := game positionFor: position whenMoving: 21.
	self assert: newPosition tileNumber equals: 6.
	self assert: newPosition lap equals: 2.

	position := PlayerPosition of: player onLap: 2 tileNumber: 6.
	newPosition := game positionFor: position whenMoving: 5.
	self assert: newPosition tileNumber equals: 1.
	self assert: newPosition lap equals: 3