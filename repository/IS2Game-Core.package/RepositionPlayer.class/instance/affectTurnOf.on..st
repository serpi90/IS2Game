affecting
affectTurnOf: aPlayer on: aGame

	aGame move: aPlayer to: (PlayerPosition of: aPlayer onLap: lap tileNumber: tileNumber)