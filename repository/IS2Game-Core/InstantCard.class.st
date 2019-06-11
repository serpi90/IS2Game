Class {
	#name : #InstantCard,
	#superclass : #Card,
	#category : #'IS2Game-Core-Board'
}

{ #category : #affecting }
InstantCard >> affect: aTarget on: aGame [

	self subclassResponsibility
]

{ #category : #private }
InstantCard >> basicPlayedBy: aPlayer over: aTarget on: aGame [

	aGame playInstant: self by: aPlayer over: aTarget
]
