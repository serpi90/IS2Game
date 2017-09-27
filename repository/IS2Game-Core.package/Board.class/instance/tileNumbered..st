accessing
tileNumbered: aTileNumber

	^ tiles detect: [ :tile | tile number = aTileNumber ]