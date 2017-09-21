playing
throwDiceFor: aPlayer

	| roll currentPosition |

	self assertTurnOf: aPlayer.
	roll := dice roll.
	currentPosition := self positionOf: aPlayer.
	playerPositions add: (PlayerPosition of: aPlayer onLap: currentPosition lap + (currentPosition tile + roll quo: boardLength) tile: (currentPosition tile + roll rem: boardLength)).
	playerTurn next