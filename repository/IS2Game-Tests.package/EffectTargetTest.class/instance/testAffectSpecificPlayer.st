tests
testAffectSpecificPlayer

	self assert: player1 isOnLap: 0 tileNumber: 1.
	self assert: player2 isOnLap: 0 tileNumber: 1.
	self assert: player3 isOnLap: 0 tileNumber: 1.
	(AffectSpecificPlayer targeting: player2) apply: moveOneTile to: self becauseOf: player1.
	self assert: player1 isOnLap: 0 tileNumber: 1.
	self assert: player2 isOnLap: 0 tileNumber: 2.
	self assert: player3 isOnLap: 0 tileNumber: 1