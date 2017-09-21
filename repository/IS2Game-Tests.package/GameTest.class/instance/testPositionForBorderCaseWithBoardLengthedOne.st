tests - positions
testPositionForBorderCaseWithBoardLengthedOne

	| position game player |

	player := 'bob'.
	game := IS2Game
		withBoardOfLength: 1
		laps: 5
		dices: (Dice withSides: 6)
		for: {player}.
	position := PlayerPosition startingOf: player.
	self assert: (game positionFor: position whenMoving: 1) tileNumber equals: 0.
	self assert: (game positionFor: position whenMoving: 1) lap equals: 1.
	self assert: (game positionFor: position whenMoving: 2) tileNumber equals: 0.
	self assert: (game positionFor: position whenMoving: 2) lap equals: 2