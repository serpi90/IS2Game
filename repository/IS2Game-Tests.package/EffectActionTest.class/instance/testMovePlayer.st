tests
testMovePlayer

	self assert: player isOnLap: 0 tileNumber: 1.
	(MovePlayer movingForward: 3) affectPlayerFrom: (self positionOf: player) on: self.
	self assert: player isOnLap: 0 tileNumber: 4