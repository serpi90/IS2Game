Class {
	#name : #PlayerTurn,
	#superclass : #GameState,
	#instVars : [
		'currentPlayer'
	],
	#category : 'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
PlayerTurn class >> currentOf: aPlayer [

	^ self new initializeCurrentOf: aPlayer
]

{ #category : #asserting }
PlayerTurn >> assertCanPlayPermanentCard: aPlayer [

	self assertIsTurnOf: aPlayer
]

{ #category : #asserting }
PlayerTurn >> assertCanRollDice: aPlayer [

	self assertIsTurnOf: aPlayer
]

{ #category : #asserting }
PlayerTurn >> assertIsTurnOf: aPlayer [

	AssertionChecker
		enforce: [ aPlayer = self currentPlayer ]
		because: ( '<1s> can not play now, it''s <2s>''s turn' expandMacrosWith: aPlayer with: self currentPlayer )
]

{ #category : #accessing }
PlayerTurn >> currentOf: aPlayer [

	^ self class currentOf: aPlayer
]

{ #category : #accessing }
PlayerTurn >> currentPlayer [

	^ currentPlayer
]

{ #category : #testing }
PlayerTurn >> hasEnded [

	^ false
]

{ #category : #initialization }
PlayerTurn >> initializeCurrentOf: aPlayer [

	currentPlayer := aPlayer
]

{ #category : #accessing }
PlayerTurn >> winner [

	^ AssertionFailed signal: 'Can not define a winner until game has ended'
]
