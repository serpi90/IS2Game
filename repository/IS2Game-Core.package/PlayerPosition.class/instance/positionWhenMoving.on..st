accessing
positionWhenMoving: aNumberOfTiles on: aBoard

	^ self class of: self player onLap: self lap + (self tileNumber + aNumberOfTiles quo: aBoard length) tileNumber: (self tileNumber + aNumberOfTiles rem: aBoard length)