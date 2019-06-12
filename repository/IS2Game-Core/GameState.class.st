Class {
	#name : #GameState,
	#superclass : #Object,
	#category : 'IS2Game-Core-Game'
}

{ #category : #asserting }
GameState >> assert: aPlayer canPlayCard: aCard [

	self subclassResponsibility
]

{ #category : #asserting }
GameState >> assertCanRollDice: aPlayer [

	self subclassResponsibility
]

{ #category : #accessing }
GameState >> currentPlayer [

	self subclassResponsibility
]

{ #category : #testing }
GameState >> hasEnded [

	self subclassResponsibility
]

{ #category : #accessing }
GameState >> history [

	self subclassResponsibility
]

{ #category : #accessing }
GameState >> positionHistoryFor: aPlayer [

	^ self history select: [ :event | ( event isA: PlayerPosition ) and: [ event player = aPlayer ] ]
]

{ #category : #accessing }
GameState >> positionOf: aPlayer [

	self subclassResponsibility
]

{ #category : #accessing }
GameState >> winner [

	self subclassResponsibility
]
