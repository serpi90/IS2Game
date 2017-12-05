playing
rollDiceFor: aPlayer

	| roll |

	status assertCanRollDice: aPlayer.
	roll := self adjustedRollFor: aPlayer whenRolled: dice roll.
	self move: aPlayer tiles: roll.
	self applyTileEfectOn: (self positionOf: aPlayer).
	status := status currentOf: playerTurn next