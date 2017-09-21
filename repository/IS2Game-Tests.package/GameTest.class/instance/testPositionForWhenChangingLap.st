tests - positions
testPositionForWhenChangingLap

	| position game player |

	player := 'bob'.
	game := IS2Game
		withBoardOfLength: 10
		laps: 5
		dices: (Dice withSides: 6)
		for: {player}.
	position := PlayerPosition of: player onLap: 0 tileNumber: 9.
	self assert: (game positionFor: position whenMoving: 1) tileNumber equals: 0.
	self assert: (game positionFor: position whenMoving: 1) lap equals: 1.

	position := PlayerPosition of: player onLap: 0 tileNumber: 4.
	self assert: (game positionFor: position whenMoving: 21) tileNumber equals: 5.
	self assert: (game positionFor: position whenMoving: 21) lap equals: 2.

	position := PlayerPosition of: player onLap: 2 tileNumber: 5.
	self assert: (game positionFor: position whenMoving: 5) tileNumber equals: 0.
	self assert: (game positionFor: position whenMoving: 5) lap equals: 3