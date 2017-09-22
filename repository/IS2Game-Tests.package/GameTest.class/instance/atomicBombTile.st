accessing
atomicBombTile

	^ Tile
		doing: (AffectEveryone applying: (RepositionPlayer toLap: 0 tileNumber: 0))
		named: 'Atomic Bomb'