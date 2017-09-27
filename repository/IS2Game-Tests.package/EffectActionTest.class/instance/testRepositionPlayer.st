tests
testRepositionPlayer

	self assert: player isOnLap: 0 tileNumber: 1.
	(RepositionPlayer toLap: 3 tileNumber: 5) affectPlayerFrom: (self positionOf: player) on: self.
	self assert: player isOnLap: 3 tileNumber: 5