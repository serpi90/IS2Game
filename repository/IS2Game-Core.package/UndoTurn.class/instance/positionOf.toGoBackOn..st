accessing
positionOf: player toGoBackOn: aGame

	"Why turns + 2 ?
	- 1 for the move made in this turn
	- 1 for the position at the beginning of this turn
	- n for the turns to go back
	
	We reverse and then copyUpTo:, to avoid problems with not having enough history (eg landing on a TimeMachine on the first throw)."

	^ ((aGame historyFor: player) reverse copyUpTo: 2 + turns) last