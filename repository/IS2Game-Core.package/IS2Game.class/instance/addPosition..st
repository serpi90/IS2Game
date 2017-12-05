playing
addPosition: aPlayerPosition

	playerPositions add: aPlayerPosition.
	aPlayerPosition lap >= laps
		ifTrue: [ status := GameEnded wonBy: aPlayerPosition player ]