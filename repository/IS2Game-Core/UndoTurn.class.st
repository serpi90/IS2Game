Class {
	#name : #UndoTurn,
	#superclass : #EffectAction,
	#instVars : [
		'turns'
	],
	#category : 'IS2Game-Core-Effect'
}

{ #category : #'instance creation' }
UndoTurn class >> goingBack: aNumberOfTurns [

	AssertionChecker enforce: [ aNumberOfTurns >= 0 ] because: 'Can not undo a negative player of turns' raising: InstanceCreationFailed.
	^ self new initializeGoingBack: aNumberOfTurns
]

{ #category : #'instance creation' }
UndoTurn class >> resetTurn [

	^ self goingBack: 0
]

{ #category : #affecting }
UndoTurn >> affectTurnOf: aPlayer on: aGame [

	| previousTurnPosition |

	previousTurnPosition := self positionOf: aPlayer toGoBackOn: aGame.
	aGame
		addPosition:
			(PlayerPosition
				of: aPlayer
				onLap: previousTurnPosition lap
				tileNumber: previousTurnPosition tileNumber)
]

{ #category : #initialization }
UndoTurn >> initializeGoingBack: aNumberOfTurns [

	turns := aNumberOfTurns
]

{ #category : #private }
UndoTurn >> positionOf: aPlayer toGoBackOn: aGame [

	"Why turns + 2 ?
	+ 1 for the move made in this turn
	+ 1 for the position at the beginning of this turn
	+ n for the turns to go back"

	| history |

	history := aGame historyFor: aPlayer.
	^ history size > (2 + turns)
		ifTrue: [ (history allButLast: 2 + turns) last ]
		ifFalse: [ history first ]
]

{ #category : #printing }
UndoTurn >> printOn: aStream [

	aStream
		nextPutAll:
			('Go back <1p> turn<2s>'
				expandMacrosWith: turns
				with:
					(turns = 1
						ifTrue: [ '' ]
						ifFalse: [ 's' ]))
]
