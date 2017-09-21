accessing
lapNumberWhenMoving: aNumberOfTiles from: aPlayerPosition on: aBoard

	^ aPlayerPosition lap + (aPlayerPosition tileNumber + aNumberOfTiles quo: aBoard length)