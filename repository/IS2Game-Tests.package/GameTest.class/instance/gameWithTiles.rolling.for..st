accessing
gameWithTiles: tiles rolling: diceRolls for: players

	^ IS2Game
		withBoard: (Board withTiles: tiles)
		laps: 3
		dice:
			(Dice withSides: 6 source: (SequentialGenerator generating: diceRolls))
		for: players