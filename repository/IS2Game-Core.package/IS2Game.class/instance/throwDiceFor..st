playing
throwDiceFor: aPlayer

	self assertCanPlay: aPlayer.
	playerPositions add: (board nextPositionFor: (self positionOf: aPlayer) whenRolled: dice roll on: self).
	playerTurn next