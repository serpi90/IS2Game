affecting
affectTurnOf: aPlayer on: aGame

	| previousTurnPosition |

	previousTurnPosition := self positionOf: aPlayer toGoBackOn: aGame.
	aGame
		move: aPlayer
		to: (PlayerPosition of: aPlayer onLap: previousTurnPosition lap tileNumber: previousTurnPosition tileNumber)