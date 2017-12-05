affecting
affectTurnOf: aPlayer on: aGame

	aGame
		addPosition: (PlayerPosition of: aPlayer onLap: lap tileNumber: tileNumber)