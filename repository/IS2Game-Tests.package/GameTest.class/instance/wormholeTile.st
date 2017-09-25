accessing
wormholeTile

	^ Tile
		affecting: AffectPlayer new
		doing: (MovePlayer movingForward: -4)
		named: 'Wormhole'