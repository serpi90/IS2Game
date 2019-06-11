Class {
	#name : #InstantCard,
	#superclass : #Card,
	#category : #'IS2Game-Core-Cards'
}

{ #category : #affecting }
InstantCard >> affect: aTarget on: aGame [

	self subclassResponsibility
]

{ #category : #asserting }
InstantCard >> assertCanBePlayedBy: aPlayer onTurnOf: aCurrentPlayer [

	
]
