Class {
	#name : #PlayerTurn,
	#superclass : #GameState,
	#instVars : [
		'currentPlayer',
		'previousState',
		'events'
	],
	#category : #'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
PlayerTurn class >> currentOf: aPlayer precededBy: aGameState [

	^ self new initializeCurrentOf: aPlayer precededBy: aGameState
]

{ #category : #asserting }
PlayerTurn >> assert: aPlayer canPlayCard: aCard [

	aCard assertCanBePlayedBy: aPlayer onTurnOf: currentPlayer
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

{ #category : #'instance creation' }
PlayerTurn >> currentOf: aPlayer [

	^ self class currentOf: aPlayer precededBy: self
]

{ #category : #accessing }
PlayerTurn >> currentPlayer [

	^ currentPlayer
]

{ #category : #testing }
PlayerTurn >> hasEnded [

	^ false
]

{ #category : #accessing }
PlayerTurn >> history [

	^ previousState history , events
]

{ #category : #accessing }
PlayerTurn >> historyFor: aPlayer [

	^ ( previousState historyFor: aPlayer ) , events
		select: [ :event | ( event isA: PlayerPosition ) and: [ event player = aPlayer ] ]
]

{ #category : #initialization }
PlayerTurn >> initializeCurrentOf: aPlayer precededBy: aGameState [

	previousState := aGameState.
	events := OrderedCollection new.
	currentPlayer := aPlayer
]

{ #category : #accessing }
PlayerTurn >> positionOf: aPlayer [

	^ events
		detectLast: [ :event | ( event isA: PlayerPosition ) and: [ event player = aPlayer ] ]
		ifNone: [ previousState positionOf: aPlayer ]
]

{ #category : #accessing }
PlayerTurn >> registerEvent: anEvent [

	events add: anEvent
]

{ #category : #accessing }
PlayerTurn >> winner [

	^ AssertionFailed signal: 'Can not define a winner until game has ended'
]
