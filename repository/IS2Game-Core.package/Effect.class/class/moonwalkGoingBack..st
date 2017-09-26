instance creation
moonwalkGoingBack: aNumberOfTiles

	^ self named: 'Moonwalk' affecting: AffectEveryoneElse new doing: (MovePlayer goingBack: aNumberOfTiles)