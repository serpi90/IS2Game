instance creation
withBoardLength: aLength laps: aNumberOfLaps dices: aDice for: somePlayers

	^ self new
		initializeWithBoardLength: aLength
		laps: aNumberOfLaps
		dices: aDice
		for: somePlayers