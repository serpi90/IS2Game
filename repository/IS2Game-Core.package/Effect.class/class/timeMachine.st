instance creation
timeMachine

	^ self named: 'Time Machine' affecting: AffectPlayer new doing: (UndoTurn goingBack: 1)