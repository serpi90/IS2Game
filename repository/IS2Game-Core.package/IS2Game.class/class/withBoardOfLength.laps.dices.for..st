instance creation
withBoardOfLength: aLength laps: aNumberOfLaps dices: aDice for: somePlayers

	^ self
		withBoard: (Board withTiles: ((1 to: aLength) collect: [ :e | Tile empty ]))
		laps: aNumberOfLaps
		dice: aDice
		for: somePlayers