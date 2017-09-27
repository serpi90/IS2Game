tests - positions
testPositionForWhenNotChangingLap

	| position game player newPosition |

	player := 'bob'.
	game := IS2Game
		withBoard: (Board withTiles: (self emptyTiles: 10))
		laps: 5
		dice: (Dice withSides: 6)
		for: {player}.
	position := PlayerPosition startingOf: player.
	newPosition := game positionFor: position whenMoving: 1.
	self assert: newPosition tileNumber equals: 2.
	self assert: newPosition lap equals: 0.

	position := PlayerPosition of: player onLap: 2 tileNumber: 5.
	newPosition := game positionFor: position whenMoving: 3.
	self assert: newPosition tileNumber equals: 8.
	self assert: newPosition lap equals: 2.

	position := PlayerPosition of: player onLap: 2 tileNumber: 3.
	newPosition := game positionFor: position whenMoving: 5.
	self assert: newPosition tileNumber equals: 8.
	self assert: newPosition lap equals: 2