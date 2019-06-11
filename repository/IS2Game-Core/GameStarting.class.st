Class {
	#name : #GameStarting,
	#superclass : #GameState,
	#instVars : [
		'players'
	],
	#category : #'IS2Game-Core-Game'
}

{ #category : #'instance creation' }
GameStarting class >> forAll: aPlayercollection [

	^ self new initializeForAll: aPlayercollection
]

{ #category : #asserting }
GameStarting >> assertCanPlayPermanentCard: aPlayer [

	^ self cantPlayBecauseGameNotStarted
]

{ #category : #asserting }
GameStarting >> assertCanRollDice: aPlayer [

	^ self cantPlayBecauseGameNotStarted
]

{ #category : #initialization }
GameStarting >> cantPlayBecauseGameNotStarted [

	AssertionFailed signal: 'The game has not yet started'
]

{ #category : #'instance creation' }
GameStarting >> currentOf: aPlayer [

	^ PlayerTurn currentOf: aPlayer precededBy: self
]

{ #category : #accessing }
GameStarting >> currentPlayer [

	^ self cantPlayBecauseGameNotStarted
]

{ #category : #testing }
GameStarting >> hasEnded [

	^ false
]

{ #category : #accessing }
GameStarting >> historyFor: aPlayer [

	^ Array with: ( self positionOf: aPlayer )
]

{ #category : #initialization }
GameStarting >> initializeForAll: aPlayerCollection [

	players := aPlayerCollection
]

{ #category : #accessing }
GameStarting >> positionOf: aPlayer [

	( players includes: aPlayer )
		ifFalse: [ AssertionFailed signal: '<1p> is not a player in the game' ].
	^ PlayerPosition startingOf: aPlayer
]

{ #category : #accessing }
GameStarting >> winner [

	^ AssertionFailed signal: 'Can not define a winner until game has ended'
]
