private
positionOf: aPlayer toGoBackOn: aGame

	"Why turns + 2 ?
	+ 1 for the move made in this turn
	+ 1 for the position at the beginning of this turn
	+ n for the turns to go back"

	| history |

	history := aGame historyFor: aPlayer.
	^ history size > (2 + turns)
		ifTrue: [ (history allButLast: 2 + turns) last ]
		ifFalse: [ history first ]