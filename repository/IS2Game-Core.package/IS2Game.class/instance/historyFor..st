accessing
historyFor: aPlayer

	^ playerPositions select: [ :position | position player = aPlayer ]