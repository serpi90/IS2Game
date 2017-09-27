tests
testAffectEveryone

	self assert: player1 isOnLap: 0 tileNumber: 1.
	self assert: player2 isOnLap: 0 tileNumber: 1.
	self assert: player3 isOnLap: 0 tileNumber: 1.
	AffectEveryone new apply: moveOneTile to: self becausePlayerLandedOn: (playerPositions at: player1).
	self assert: player1 isOnLap: 0 tileNumber: 2.
	self assert: player2 isOnLap: 0 tileNumber: 2.
	self assert: player3 isOnLap: 0 tileNumber: 2