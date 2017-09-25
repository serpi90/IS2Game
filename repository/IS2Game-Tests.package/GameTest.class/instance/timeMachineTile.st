accessing
timeMachineTile

	^ Tile
		affecting: AffectPlayer new
		doing: (UndoTurn goingBack: 1)
		named: 'Time Machine'