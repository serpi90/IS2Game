Class {
	#name : #GameState,
	#superclass : #Object,
	#category : 'IS2Game-Core-Game'
}

{ #category : #asserting }
GameState >> assertCanPlayPermanentCard: aPlayer [

	^ self subclassResponsibility
]

{ #category : #asserting }
GameState >> assertCanRollDice: aPlayer [

	^ self subclassResponsibility
]

{ #category : #accessing }
GameState >> currentOf: aPlayer [

	^ self subclassResponsibility
]

{ #category : #accessing }
GameState >> currentPlayer [

	^ self subclassResponsibility
]

{ #category : #testing }
GameState >> hasEnded [

	^ self subclassResponsibility
]

{ #category : #accessing }
GameState >> winner [

	^ self subclassResponsibility
]
