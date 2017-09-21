tests - positions
testPositionForWhenNotChangingLap

	| position game player |

	player := 'bob'.
	game := IS2Game
		withBoardOfLength: 10
		laps: 5
		dices: (Dice withSides: 6)
		for: {player}.
	position := PlayerPosition startingOf: player.
	self assert: (game positionFor: position whenMoving: 1) tileNumber equals: 1.
	self assert: (game positionFor: position whenMoving: 1) lap equals: 0.

	position := PlayerPosition of: player onLap: 2 tileNumber: 4.
	self assert: (game positionFor: position whenMoving: 3) tileNumber equals: 7.
	self assert: (game positionFor: position whenMoving: 3) lap equals: 2.

	position := PlayerPosition of: player onLap: 2 tileNumber: 3.
	self assert: (game positionFor: position whenMoving: 5) tileNumber equals: 8.
	self assert: (game positionFor: position whenMoving: 5) lap equals: 2