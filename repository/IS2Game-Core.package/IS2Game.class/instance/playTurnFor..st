playing
playTurnFor: aPlayer

	self assertCanPlay: aPlayer.
	self move: aPlayer tiles: dice roll.
	self applyTileEfectOn: (self positionOf: aPlayer).
	playerTurn next