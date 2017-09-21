accessing
positionOf: aPlayer

	^ (playerPositions select: [ :position | position player = aPlayer ]) last