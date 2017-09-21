tests-accessing
gameFor: bob on: board

	^ IS2Game
		withBoard: board
		laps: 2
		dice: (Dice withSides: 2)
		for: {bob}