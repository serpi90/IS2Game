accessing
affectPlayerFrom: aPlayerPosition on: aGame

	| previousTurnPosition |

	previousTurnPosition := self positionOf: aPlayerPosition player toGoBackOn: aGame.
	aGame
		move: aPlayerPosition player
		to: (PlayerPosition of: aPlayerPosition player onLap: previousTurnPosition lap tileNumber: previousTurnPosition tileNumber)