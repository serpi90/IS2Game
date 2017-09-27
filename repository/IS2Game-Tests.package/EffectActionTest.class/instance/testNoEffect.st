tests
testNoEffect

	self assert: player isOnLap: 0 tileNumber: 1.
	NoEffect new affectPlayerFrom: (self positionOf: player) on: self.
	self assert: player isOnLap: 0 tileNumber: 1