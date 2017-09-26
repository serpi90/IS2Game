running
setUp

	super setUp.

	empty := Tile empty.
	atomicBomb := Tile affecting: AffectEveryone new doing: (RepositionPlayer toLap: 0 tileNumber: 0) named: 'Atomic Bomb'.
	wormhole := Tile affecting: AffectPlayer new doing: (MovePlayer goingBack: 4) named: 'Wormhole'.
	speedUp := Tile affecting: AffectPlayer new doing: (MovePlayer movingForward: 4) named: 'Speed Up'.
	moonwalk := Tile affecting: AffectEveryoneElse new doing: (MovePlayer goingBack: 3) named: 'Speed Up'.
	timeMachine := Tile affecting: AffectPlayer new doing: (UndoTurn goingBack: 1) named: 'Time Machine'