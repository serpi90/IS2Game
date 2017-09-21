instance creation
withBoardOfLength: aLength laps: aNumberOfLaps dices: aDice for: somePlayers

	^ self
		withBoard: (Board withTiles: (Array new: aLength withAll: EmptyTile new))
		laps: aNumberOfLaps
		dice: aDice
		for: somePlayers