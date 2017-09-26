accessing
positionFor: aPlayerPosition whenMoving: aNumberOfTiles

	| totalMoves |

	totalMoves := aPlayerPosition lap * board length
		+ aPlayerPosition tileNumber - 1 + aNumberOfTiles.
	^ PlayerPosition
		of: aPlayerPosition player
		onLap: (totalMoves quo: board length)
		tileNumber: (totalMoves rem: board length) + 1