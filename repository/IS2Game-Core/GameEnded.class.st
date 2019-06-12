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
GameEnded >> assert: aPlayer canPlayCard: aCard [

	AssertionFailed signal: 'The game has ended'
]

{ #category : #asserting }
GameEnded >> assertCanPlayPermanentCard: aPlayer [

	AssertionFailed signal: 'The game has ended'
]

{ #category : #asserting }
GameEnded >> assertCanRollDice: aPlayer [

	AssertionFailed signal: 'The game has ended'
]

{ #category : #accessing }
GameEnded >> currentPlayer [

	^ AssertionFailed signal: 'The game has ended'
]

{ #category : #testing }
GameEnded >> hasEnded [

	^ true
]

{ #category : #accessing }
GameEnded >> history [

	^ previousState history
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
