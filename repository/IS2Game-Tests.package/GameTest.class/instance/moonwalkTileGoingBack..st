accessing
moonwalkTileGoingBack: aNumberOfTiles

	^ Tile affecting: AffectEveryoneElse new doing: (MovePlayer goingBack: aNumberOfTiles) named: 'Moonwalk'