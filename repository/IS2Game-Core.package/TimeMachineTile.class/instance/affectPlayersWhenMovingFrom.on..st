accessing
affectPlayersWhenMovingFrom: aPlayerPosition on: aGame

	"Why 3?
	- 1 for the move made in this turn
	- 1 for the position at the beginning of this turn
	- 1 for the one we want if we ever want to go back longer, then this one will change.
	
	We reverse and then copyUpTo:, to avoid problems with not having enough history (eg landing on a TimeMachine on the first throw)."

	| previousTurnPosition player |

	player := aPlayerPosition player.
	previousTurnPosition := ((aGame historyFor: player) reverse copyUpTo: 3) last.
	aGame move: player to: (PlayerPosition of: player onLap: previousTurnPosition lap tileNumber: previousTurnPosition tileNumber)