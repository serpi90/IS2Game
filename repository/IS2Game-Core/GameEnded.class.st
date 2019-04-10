Class {
	#name : #GameEnded,
	#superclass : #GameState,
	#instVars : [
		'winner'
	],
	#category : 'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
GameEnded class >> wonBy: aPlayer [

	^ self new initializeWonBy: aPlayer
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

	AssertionFailed
		signal:
			('<1s> can not play now, the game has ended' expandMacrosWith: aPlayer)
]

{ #category : #accessing }
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

{ #category : #initialization }
GameEnded >> initializeWonBy: aPlayer [

	winner := aPlayer
]

{ #category : #accessing }
GameEnded >> winner [

	^ winner
]
