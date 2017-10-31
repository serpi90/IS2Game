playing
rollDiceFor: aPlayer

	| roll |

	self assertCanPlay: aPlayer.
	roll := (self permanentEffectsFor: aPlayer) inject: dice roll into: [ :affectedRoll :effect | effect affectRoll: affectedRoll ].
	self move: aPlayer tiles: roll.
	self applyTileEfectOn: (self positionOf: aPlayer).
	playerTurn next