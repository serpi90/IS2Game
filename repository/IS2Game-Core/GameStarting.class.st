Class {
	#name : #GameStarting,
	#superclass : #GameState,
	#instVars : [
		'positions'
	],
	#category : #'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
GameStarting class >> forAll: aPlayercollection [

	^ self new initializeForAll: aPlayercollection
]

{ #category : #asserting }
GameStarting >> assert: aPlayer canPlayCard: aCard [

	AssertionFailed signal: 'The game has not yet started'
]

{ #category : #asserting }
GameStarting >> assertCanRollDice: aPlayer [

	AssertionFailed signal: 'The game has not yet started'
]

{ #category : #accessing }
GameStarting >> currentPlayer [

	^ AssertionFailed signal: 'The game has not yet started'
]

{ #category : #testing }
GameStarting >> hasEnded [

	^ false
]

{ #category : #accessing }
GameStarting >> history [

	^ positions
]

{ #category : #initialization }
GameStarting >> initializeForAll: aPlayerCollection [

	positions := aPlayerCollection collect: [ :player | PlayerPosition startingOf: player ]
]

{ #category : #accessing }
GameStarting >> positionOf: aPlayer [

	^ positions
		detect: [ :position | position player = aPlayer ]
		ifNone: [ AssertionFailed signal: '<1p> is not a player in the game' ]
]

{ #category : #accessing }
GameStarting >> winner [

	^ AssertionFailed signal: 'The game has not yet started'
]
