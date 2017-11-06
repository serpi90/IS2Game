playing
rollDiceFor: aPlayer

	| roll |

	self assertCanPlay: aPlayer.
	roll := self adjustedRollFor: aPlayer whenRolled: dice roll.
	self move: aPlayer tiles: roll.
	self applyTileEfectOn: (self positionOf: aPlayer).
	playerTurn next