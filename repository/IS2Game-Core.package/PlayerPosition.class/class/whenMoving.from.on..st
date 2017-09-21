instance creation
whenMoving: aNumberOfTiles from: aPlayerPosition on: aBoard

	| calculator |

	calculator := PositionCalculator new.
	^ self
		of: aPlayerPosition player
		onLap: (calculator lapNumberWhenMoving: aNumberOfTiles from: aPlayerPosition on: aBoard)
		tileNumber: (calculator tileNumberWhenMoving: aNumberOfTiles from: aPlayerPosition on: aBoard)