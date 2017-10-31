tests - positions
testPositionForWhenChangingLapBackwards

	| position game newPosition |

	game := self gameWithBoardLength: 10 for: {bob}.
	position := PlayerPosition of: bob onLap: 0 tileNumber: 1.
	newPosition := game positionFor: position whenMoving: -1.
	self assert: newPosition tileNumber equals: 10.
	self assert: newPosition lap equals: -1