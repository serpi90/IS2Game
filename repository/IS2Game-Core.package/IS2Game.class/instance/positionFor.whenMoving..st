accessing
positionFor: aPlayerPosition whenMoving: aNumberOfTiles

	^ PlayerPosition
		of: aPlayerPosition player
		onLap: aPlayerPosition lap + (aPlayerPosition tileNumber + aNumberOfTiles quo: board length)
		tileNumber: (aPlayerPosition tileNumber + aNumberOfTiles rem: board length)