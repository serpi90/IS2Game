Class {
	#name : #GameEnded,
	#superclass : #GameState,
	#instVars : [
		'winner',
		'previousState'
	],
	#category : #'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
GameEnded class >> wonBy: aPlayer precededBy: aGameState [

	^ self new initializeWonBy: aPlayer precededBy: aGameState
]

{ #category : #asserting }
GameEnded >> assertCanPlayPermanentCard: aPlayer [

	self cantPlayBecauseGameEnded: aPlayer
]

{ #category : #asserting }
GameEnded >> assertCanRollDice: aPlayer [

	self cantPlayBecauseGameEnded: aPlayer
]

{ #category : #signaling }
GameEnded >> cantPlayBecauseGameEnded: aPlayer [

	AssertionFailed signal: ( '<1s> can not play now, the game has ended' expandMacrosWith: aPlayer )
]

{ #category : #'instance creation' }
GameEnded >> currentOf: aPlayer [

	^ self
]

{ #category : #accessing }
GameEnded >> currentPlayer [

	^ winner
]

{ #category : #testing }
GameEnded >> hasEnded [

	^ true
]

{ #category : #accessing }
GameEnded >> historyFor: aPlayer [

	^ previousState historyFor: aPlayer
]

{ #category : #initialization }
GameEnded >> initializeWonBy: aPlayer precededBy: aGameState [

	previousState := aGameState.
	winner := aPlayer
]

{ #category : #accessing }
GameEnded >> positionOf: aPlayer [

	^ previousState positionOf: aPlayer
]

{ #category : #accessing }
GameEnded >> winner [

	^ winner
]
