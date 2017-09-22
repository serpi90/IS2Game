accessing
moonwalkTileGoingBack: aNumberOfTiles

	^ Tile doing: (AffectEveryone applying: (MovePlayer goingBack: aNumberOfTiles)) named: 'Moonwalk'