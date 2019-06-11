Class {
	#name : #PlayerTurn,
	#superclass : #GameState,
	#instVars : [
		'currentPlayer',
		'positions',
		'previousState'
	],
	#category : #'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
PlayerTurn class >> currentOf: aPlayer precededBy: aGameState [

	^ self new initializeCurrentOf: aPlayer precededBy: aGameState
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
PlayerTurn >> historyFor: aPlayer [

	^ ( previousState historyFor: aPlayer )
		, ( positions select: [ :position | position player = aPlayer ] )
]

{ #category : #initialization }
PlayerTurn >> initializeCurrentOf: aPlayer precededBy: aGameState [

	previousState := aGameState.
	positions := OrderedCollection new.
	currentPlayer := aPlayer
]

{ #category : #accessing }
PlayerTurn >> positionOf: aPlayer [

	^ positions
		detectLast: [ :position | position player = aPlayer ]
		ifNone: [ previousState positionOf: aPlayer ]
]

{ #category : #accessing }
PlayerTurn >> registerPosition: aPlayerPosition [

	positions add: aPlayerPosition
]

{ #category : #accessing }
PlayerTurn >> winner [

	^ AssertionFailed signal: 'Can not define a winner until game has ended'
]
