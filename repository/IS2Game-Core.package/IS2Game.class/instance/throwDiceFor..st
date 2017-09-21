playing
throwDiceFor: aPlayer

	self assertCanPlay: aPlayer.
	self move: aPlayer tiles: dice roll.
	self applyTileEfectsOn: (self positionOf: aPlayer).
	playerTurn next