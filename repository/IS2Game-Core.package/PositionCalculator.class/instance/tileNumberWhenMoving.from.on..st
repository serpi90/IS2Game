accessing
tileNumberWhenMoving: aNumberOfTiles from: aPlayerPosition on: aBoard

	^ aPlayerPosition tileNumber + aNumberOfTiles rem: aBoard length