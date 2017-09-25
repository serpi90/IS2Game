accessing
speedUpTile

	^ Tile
		affecting: AffectPlayer new
		doing: (MovePlayer movingForward: 4)
		named: 'Speed Up'